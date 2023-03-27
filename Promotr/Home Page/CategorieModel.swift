//
//  CategorieModel.swift
//  Promotr
//
//  Created by Mac on 3/2/23.
//

import Foundation
struct CategorieModel : Codable {
    let errors : Bool?
    let data : CategoryData?
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decodeIfPresent(CategoryData.self, forKey: .data
        )
    }
}
struct CategoryData:Codable {
    var cats : [categories]?
    enum CodingKeys: String, CodingKey {
        case cats = "categories"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cats = try values.decodeIfPresent([categories].self, forKey: .cats)
    }
}
struct categories:Codable {
    var id :Int?
    var name: String?
    var full_image_url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case full_image_url = "full_image_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        full_image_url = try values.decodeIfPresent(String.self, forKey: .full_image_url)
        
    }
    
}


// promoof the day data

struct PromoData : Codable {
    let errors : Bool?
    let data : promoCodeOftheDay?
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decodeIfPresent(promoCodeOftheDay.self, forKey: .data
        )
    }
}
struct promoCodeOftheDay : Codable {
    
    var promocode : [promocodesKey]?
    enum CodingKeys: String, CodingKey {
        case promocode = "promocodes"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        promocode = try values.decodeIfPresent([promocodesKey].self, forKey: .promocode)
    }

}
struct promocodesKey : Codable {
    var id :Int?
    var title: String?
    var description: String?
    var code_id:String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case code_id = "code_id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        code_id = try values.decodeIfPresent(String.self, forKey: .code_id)
        
    }
    
}
//"promocodes": [
//    {
//        "id": 1,
//        "title": "NIKE DISCOUNT",
//        "description": "10% discount on NIKE shoes",
//        "code_id": "NIKE10",
//        "discount_amount": "10.00",
//        "expiry_date": "2023-03-29T00:00:00.000000Z",
//        "category_id": null,
//        "brand_store_id": null,
//        "influencer_id": null,
//        "created_at": "2023-03-03T09:47:30.000000Z",
//        "updated_at": "2023-03-03T09:47:30.000000Z"
//    }
