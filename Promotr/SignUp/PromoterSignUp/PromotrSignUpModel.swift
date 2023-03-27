//
//  PromotrSignUpModel.swift
//  Promotr
//
//  Created by Mac on 3/27/23.
//

import Foundation
struct PromotrSignUpModel : Codable  {
    let errors:Bool?
    let data:promoterSingupData?
    
    enum CodingKeys  :String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decode(promoterSingupData.self, forKey: .data)
    }
}

struct promoterSingupData : Codable {
    let promoterInformation : promoterInfo?
    
    enum  CodingKeys : String, CodingKey {
        case promoterInformation = "promoterInfo"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        promoterInformation = try values.decode(promoterInfo.self, forKey:.promoterInformation)
    }
}
struct promoterInfo : Codable {
    let about:String?
    let instagram_profile_url:String?
    let user_id:Int?
    let status:String?
    let image_url:String?
    let id:Int?
    let full_image_url:String?
    
    enum CodingKeys : String, CodingKey {
        case about = "about"
        case instagram_profile_url = "instagram_profile_url"
        case user_id = "user_id"
        case status = "status"
        case image_url = "image_url"
        case id = "id"
        case full_image_url = "full_image_url"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        about = try values.decode(String.self, forKey: .about)
        instagram_profile_url = try values.decode(String.self, forKey: .instagram_profile_url)
        user_id = try values.decode(Int.self, forKey: .user_id)
        status = try values.decode(String.self, forKey: .status)
        image_url = try values.decode(String.self, forKey: .image_url)
        id = try values.decode(Int.self, forKey: .id)
        full_image_url = try values.decode(String.self, forKey: .full_image_url)
    }
    
}
/*
 promoterInfo": {
             "about": "asdsadadsadasdadasdsadasdasdadasdsasdasdasda sda sdads d",
             "instagram_profile_url": "https://instagram.com/ayre",
             "user_id": 3,
             "status": "active",
             "image_url": "promoters/user_3/profile_images/iM5dBo0G3xAZOHc4Kblchni8k1J2IsE58IDWdUAr.png",
             "updated_at": "2023-03-27T05:58:14.000000Z",
             "created_at": "2023-03-27T05:58:14.000000Z",
             "id": 5,
             "full_image_url": "https://api.promotr.club/storage/promoters/user_3/profile_images/iM5dBo0G3xAZOHc4Kblchni8k1J2IsE58IDWdUAr.png"
         }
 */
