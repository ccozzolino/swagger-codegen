// Models.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

protocol JSONEncodable {
    func encodeToJSON() -> AnyObject
}

public class Response<T> {
    public let statusCode: Int
    public let header: [String: String]
    public let body: T

    public init(statusCode: Int, header: [String: String], body: T) {
        self.statusCode = statusCode
        self.header = header
        self.body = body
    }

    public convenience init(response: NSHTTPURLResponse, body: T) {
        let rawHeader = response.allHeaderFields
        var header = [String:String]()
        for (key, value) in rawHeader {
            header[key as! String] = value as? String
        }
        self.init(statusCode: response.statusCode, header: header, body: body)
    }
}

private var once = dispatch_once_t()
class Decoders {
    static private var decoders = Dictionary<String, ((AnyObject) -> AnyObject)>()
    
    static func addDecoder<T>(clazz clazz: T.Type, decoder: ((AnyObject) -> T)) {
        let key = "\(T.self)"
        decoders[key] = { decoder($0) as! AnyObject }
    }
    
    static func decode<T>(clazz clazz: [T].Type, source: AnyObject) -> [T] {
        let array = source as! [AnyObject]
        return array.map { Decoders.decode(clazz: T.self, source: $0) }
    }
    
    static func decode<T, Key: Hashable>(clazz clazz: [Key:T].Type, source: AnyObject) -> [Key:T] {
        let sourceDictinoary = source as! [Key: AnyObject]
        var dictionary = [Key:T]()
        for (key, value) in sourceDictinoary {
            dictionary[key] = Decoders.decode(clazz: T.self, source: value)
        }
        return dictionary
    }
    
    static func decode<T>(clazz clazz: T.Type, source: AnyObject) -> T {
        initialize()
        if source is T {
            return source as! T
        }
        
        let key = "\(T.self)"
        if let decoder = decoders[key] {
           return decoder(source) as! T
        } else {
            fatalError("Source \(source) is not convertible to type \(clazz): Maybe swagger file is insufficient")
        }
    }

    static func decodeOptional<T>(clazz clazz: T.Type, source: AnyObject?) -> T? {
        if source is NSNull {
            return nil
        }
        return source.map { (source: AnyObject) -> T in
            Decoders.decode(clazz: clazz, source: source)
        }
    }

    static func decodeOptional<T>(clazz clazz: [T].Type, source: AnyObject?) -> [T]? {
        if source is NSNull {
            return nil
        }
        return source.map { (someSource: AnyObject) -> [T] in
            Decoders.decode(clazz: clazz, source: someSource)
        }
    }

    static func decodeOptional<T, Key: Hashable>(clazz clazz: [Key:T].Type, source: AnyObject?) -> [Key:T]? {
        if source is NSNull {
            return nil
        }
        return source.map { (someSource: AnyObject) -> [Key:T] in
            Decoders.decode(clazz: clazz, source: someSource)
        }
    }
	
    static private func initialize() {
        dispatch_once(&once) {
            let formatters = [
                "yyyy-MM-dd",
                "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
                "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
                "yyyy-MM-dd'T'HH:mm:ss'Z'"
            ].map { (format: String) -> NSDateFormatter in
                let formatter = NSDateFormatter()
                formatter.dateFormat = format
                return formatter
            }
            // Decoder for NSDate
            Decoders.addDecoder(clazz: NSDate.self) { (source: AnyObject) -> NSDate in
               if let sourceString = source as? String {
                    for formatter in formatters {
                        if let date = formatter.dateFromString(sourceString) {
                            return date
                        }
                    }
                
                }
                if let sourceInt = source as? Int {
                    // treat as a java date
                    return NSDate(timeIntervalSince1970: Double(sourceInt / 1000) )
                }
                fatalError("formatter failed to parse \(source)")
            } 

			// Decoder for [Order]
            Decoders.addDecoder(clazz: [Order].self) { (source: AnyObject) -> [Order] in
                return Decoders.decode(clazz: [Order].self, source: source)
            }
			// Decoder for Order
            Decoders.addDecoder(clazz: Order.self) { (source: AnyObject) -> Order in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = Order()
                instance.id = Decoders.decodeOptional(clazz: Int.self, source: sourceDictionary["id"])
                instance.petId = Decoders.decodeOptional(clazz: Int.self, source: sourceDictionary["petId"])
                instance.quantity = Decoders.decodeOptional(clazz: Int.self, source: sourceDictionary["quantity"])
                instance.shipDate = Decoders.decodeOptional(clazz: NSDate.self, source: sourceDictionary["shipDate"])
                instance.status = Order.Status(rawValue: (sourceDictionary["status"] as? String) ?? "") 
                instance.complete = Decoders.decodeOptional(clazz: Bool.self, source: sourceDictionary["complete"])
                return instance
            }
			

			// Decoder for [User]
            Decoders.addDecoder(clazz: [User].self) { (source: AnyObject) -> [User] in
                return Decoders.decode(clazz: [User].self, source: source)
            }
			// Decoder for User
            Decoders.addDecoder(clazz: User.self) { (source: AnyObject) -> User in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = User()
                instance.id = Decoders.decodeOptional(clazz: Int.self, source: sourceDictionary["id"])
                instance.username = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["username"])
                instance.firstName = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["firstName"])
                instance.lastName = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["lastName"])
                instance.email = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["email"])
                instance.password = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["password"])
                instance.phone = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["phone"])
                instance.userStatus = Decoders.decodeOptional(clazz: Int.self, source: sourceDictionary["userStatus"])
                return instance
            }
			

			// Decoder for [Category]
            Decoders.addDecoder(clazz: [Category].self) { (source: AnyObject) -> [Category] in
                return Decoders.decode(clazz: [Category].self, source: source)
            }
			// Decoder for Category
            Decoders.addDecoder(clazz: Category.self) { (source: AnyObject) -> Category in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = Category()
                instance.id = Decoders.decodeOptional(clazz: Int.self, source: sourceDictionary["id"])
                instance.name = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["name"])
                return instance
            }
			

			// Decoder for [Tag]
            Decoders.addDecoder(clazz: [Tag].self) { (source: AnyObject) -> [Tag] in
                return Decoders.decode(clazz: [Tag].self, source: source)
            }
			// Decoder for Tag
            Decoders.addDecoder(clazz: Tag.self) { (source: AnyObject) -> Tag in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = Tag()
                instance.id = Decoders.decodeOptional(clazz: Int.self, source: sourceDictionary["id"])
                instance.name = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["name"])
                return instance
            }
			

			// Decoder for [Pet]
            Decoders.addDecoder(clazz: [Pet].self) { (source: AnyObject) -> [Pet] in
                return Decoders.decode(clazz: [Pet].self, source: source)
            }
			// Decoder for Pet
            Decoders.addDecoder(clazz: Pet.self) { (source: AnyObject) -> Pet in
                let sourceDictionary = source as! [NSObject:AnyObject]
                let instance = Pet()
                instance.id = Decoders.decodeOptional(clazz: Int.self, source: sourceDictionary["id"])
                instance.category = Decoders.decodeOptional(clazz: Category.self, source: sourceDictionary["category"])
                instance.name = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["name"])
                instance.photoUrls = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["photoUrls"])
                instance.tags = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["tags"])
                instance.status = Pet.Status(rawValue: (sourceDictionary["status"] as? String) ?? "") 
                return instance
            }
			
        }
    }
}
