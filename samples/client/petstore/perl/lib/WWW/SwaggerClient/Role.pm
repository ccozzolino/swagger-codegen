package WWW::SwaggerClient::Role;
use utf8;

use Moose::Role;
use namespace::autoclean;
use Class::Inspector;
use Log::Any qw($log);
use WWW::SwaggerClient::ApiFactory;

requires 'auth_setup_handler';

has base_url => ( is => 'ro',
			 	  required => 0,
			 	  isa => 'Str',
			 	  );

has api_factory => ( is => 'ro',
					 isa => 'WWW::SwaggerClient::ApiFactory',
					 builder => '_build_af', 
					 lazy => 1,
					 );
					 
sub BUILD {
	my $self = shift;
	
	# ignore these symbols imported into API namespaces
	my %outsiders = map {$_ => 1} qw( new croak );
	
	my %delegates;
	
	# collect the methods callable on each API
	foreach my $api_name ($self->api_factory->apis_available) {
		my $api_class = $self->api_factory->classname_for($api_name);
		my $methods = Class::Inspector->methods($api_class, 'expanded');
		my @local_methods = grep {! $outsiders{$_}} map {$_->[2]} grep {$_->[1] eq $api_class} @$methods;
		push( @{$delegates{$_}}, {api_name => $api_name, api_class => $api_class} ) for @local_methods;			
	}
	
	# remove clashes
	foreach my $method (keys %delegates) {
		if ( @{$delegates{$method}} > 1 ) {
			my ($apis) = delete $delegates{$method};
			foreach my $api (@$apis) {
				warn sprintf "Cannot delegate %s (use \$self->%s_api->%s instead)\n", $method, lc($api->{api_name}), $method;
			}
		}
	}
	
	# build the flattened API
	foreach my $api_name ($self->api_factory->apis_available) {
		my $att_name = sprintf "%s_api", lc($api_name);
		my $api_class = $self->api_factory->classname_for($api_name);
		my @delegated = grep { $delegates{$_}->[0]->{api_name} eq $api_name } keys %delegates;
		$log->debugf("Adding API: '%s' handles %s", $att_name, join ', ', @delegated);
		$self->meta->add_attribute( $att_name => ( 
									is => 'ro',
									isa => $api_class,
									default => sub {$self->api_factory->get_api($api_name)},
									lazy => 1,
									handles => \@delegated,
									) );
	}
}

sub _build_af {
	my $self = shift;
	my %args = ( auth_setup_handler_object => $self );
	$args{base_url} = $self->base_url if $self->base_url;
	return WWW::SwaggerClient::ApiFactory->new(%args);
}



1;
