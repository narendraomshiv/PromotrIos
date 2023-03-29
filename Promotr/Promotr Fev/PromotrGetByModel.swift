//
//  PromotrGetByModel.swift
//  Promotr
//
//  Created by Mac on 3/29/23.
//

import Foundation
struct PromotrGetByModel : Codable { 
    let errors:Bool?
    let data :promoterData?
    
    enum CodingKeys : String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decode(promoterData.self, forKey: .data)
    }
}
struct promoterData : Codable {
    let id:Int?
    let user_id:Int?
    let full_image_url:String?
    let userAsPromotrs:userAsPromotr?
    var promoterCreate:[ProterCreateCode]?
    enum CodingKeys : String,CodingKey {
        case id = "id"
        case user_id = "user_id"
        case full_image_url = "full_image_url"
        case userAsPromotrs = "user"
       case promoterCreate = "promocodes"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        user_id = try values.decode(Int.self, forKey: .user_id)
        full_image_url = try values.decode(String.self, forKey: .full_image_url)
        userAsPromotrs = try values.decode(userAsPromotr.self, forKey: .userAsPromotrs)
        promoterCreate = try values.decodeIfPresent([ProterCreateCode].self, forKey: .promoterCreate)
        
    }
}
struct userAsPromotr : Codable {
    
   let id:Int?
   let first_name:String?
   let last_name:String?
    
    enum CodindKeys:String,CodingKey {
        case id = "id"
        case first_name = "first_name"
        case last_name = "last_name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        first_name = try values.decode(String.self, forKey: .first_name)
        last_name = try values.decode(String.self, forKey: .last_name)
        
    }
}
struct ProterCreateCode : Codable {
    
   let id:Int?
   let title:String?
   let description:String?
   let code_id:String?
    
    enum CodindKeys:String,CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case code_id = "code_id"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        code_id = try values.decode(String.self, forKey: .code_id)
        
    }
}

//======= User Promotr Fev======
struct userPromotrFev : Codable {
    let errors:Bool?
    var data: newFavoritePromoter?
    enum CodingKeys:String,CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decode(newFavoritePromoter?.self, forKey: .data)
    }
}
struct newFavoritePromoter : Codable {
    var saveFevDatas:saveFevData?
    enum Codingkeys:String,Codable {
        case saveFevDatas = "newFavoritePromoter"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        saveFevDatas = try values.decode(saveFevData?.self, forKey: .saveFevDatas)
    }
}
struct saveFevData : Codable {
    let user_id:Int?
    let promoter_id:Int?
    let id:Int?
    enum CodingKeys:String,CodingKey {
        case user_id = "user_id"
        case promoter_id = "promoter_id"
        case id = "id"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try values.decode(Int.self, forKey: .user_id)
        promoter_id = try values.decode(Int.self, forKey: .promoter_id)
        id = try values.decode(Int.self, forKey: .id)
    }
}


/*
 {
     "errors": false,
     "data": {
         "newFavoritePromoter": {
             "user_id": 3,
             "promoter_id": 44,
             "updated_at": "2023-03-29T10:42:39.000000Z",
             "created_at": "2023-03-29T10:42:39.000000Z",
             "id": 10
         }
     }
 }
 */
// ========= get details of promotr=====
/*
 "errors": false,
     "data": {
         "promoter": {
             "id": 44,
             "user_id": 3,
             "about": "dfyhfhfghfghffgh fghfghfghfhghfgfhgfghghfhfghfghfhghfghfghfghfghfghfghfghfghfg",
             "image_url": "promoters/user_3/profile_images/1Hydx5ZrZeydBKyuXlq75FrBNYtBAJEHMSISoizy.png",
             "is_verified": false,
             "instagram_profile_url": "https://instagram.com/ayre",
             "facebook_profile_url": "https://instagram.com/ayre",
             "personal_website_url": null,
             "tiktok_handle": null,
             "status": "active",
             "created_at": "2023-03-28T05:26:39.000000Z",
             "updated_at": "2023-03-28T05:26:39.000000Z",
             "full_image_url": "https://api.promotr.club/storage/promoters/user_3/profile_images/1Hydx5ZrZeydBKyuXlq75FrBNYtBAJEHMSISoizy.png",
             "user": {
                 "id": 3,
                 "first_name": "Hemant",
                 "last_name": "Sharma",
                 "email": "mobappssolutions144@gmail.com",
                 "country": "India",
                 "gender": "male",
                 "mobile_number": "+918076747367",
                 "date_of_birth": "1988-10-27T00:00:00.000000Z",
                 "email_verified_at": null,
                 "fcm_token": null,
                 "device_name": "FC841350-D9BC-4FD6-929B-E23D00678511",
                 "locale": "en",
                 "mobile_number_verified": true,
                 "created_at": "2023-03-27T05:20:29.000000Z",
                 "updated_at": "2023-03-27T05:20:52.000000Z"
             },
             "categories": [],
             "promocodes": [
                 {
                     "id": 14,
                     "title": "Test Promo Code",
                     "description": "PromoCode for nike store",
                     "code_id": "NIKE22AED",
                     "store_name": "Nike",
                     "store_website_url": "https://nike.ae/store",
                     "image_url": null,
                     "discount_amount": "100.00",
                     "discount_amount_ceiling": null,
                     "expiry_date": "2023-08-29T00:00:00.000000Z",
                     "type": "open",
                     "category_id": 1,
                     "brand_store_id": null,
                     "promoter_id": 44,
                     "created_at": "2023-03-28T06:36:21.000000Z",
                     "updated_at": "2023-03-28T06:36:21.000000Z",
                     "full_image_url": null
                 },
 */
