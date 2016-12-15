/**
 * Swagger Petstore
 * This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.
 *
 * OpenAPI spec version: 1.0.0
 * Contact: apiteam@swagger.io
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */

/*
 * Pet.h
 *
 * A pet for sale in the pet store
 */

#ifndef Pet_H_
#define Pet_H_


#include "ModelBase.h"

#include "Category.h"
#include <cpprest/details/basic_types.h>
#include <vector>
#include "Tag.h"

namespace io {
namespace swagger {
namespace client {
namespace model {

/// <summary>
/// A pet for sale in the pet store
/// </summary>
class  Pet
    : public ModelBase
{
public:
    Pet();
    virtual ~Pet();

    /////////////////////////////////////////////
    /// ModelBase overrides

    void validate() override;

    web::json::value toJson() const override;
    void fromJson(web::json::value& json) override;

    void toMultipart(std::shared_ptr<MultipartFormData> multipart, const utility::string_t& namePrefix) const override;
    void fromMultiPart(std::shared_ptr<MultipartFormData> multipart, const utility::string_t& namePrefix) override;

    /////////////////////////////////////////////
    /// Pet members

    /// <summary>
    /// 
    /// </summary>
    int64_t getId() const;
    void setId(int64_t value);
    bool idIsSet() const;
    void unsetId();
    /// <summary>
    /// 
    /// </summary>
    std::shared_ptr<Category> getCategory() const;
    void setCategory(std::shared_ptr<Category> value);
    bool categoryIsSet() const;
    void unsetCategory();
    /// <summary>
    /// 
    /// </summary>
    utility::string_t getName() const;
    void setName(utility::string_t value);
        /// <summary>
    /// 
    /// </summary>
    std::vector<utility::string_t>& getPhotoUrls();
        /// <summary>
    /// 
    /// </summary>
    std::vector<std::shared_ptr<Tag>>& getTags();
    bool tagsIsSet() const;
    void unsetTags();
    /// <summary>
    /// pet status in the store
    /// </summary>
    utility::string_t getStatus() const;
    void setStatus(utility::string_t value);
    bool statusIsSet() const;
    void unsetStatus();

protected:
    int64_t m_Id;
    bool m_IdIsSet;
std::shared_ptr<Category> m_Category;
    bool m_CategoryIsSet;
utility::string_t m_Name;
    std::vector<utility::string_t> m_PhotoUrls;
    std::vector<std::shared_ptr<Tag>> m_Tags;
    bool m_TagsIsSet;
utility::string_t m_Status;
    bool m_StatusIsSet;
};

}
}
}
}

#endif /* Pet_H_ */
