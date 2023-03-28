//
//  AddPromoCodeModel.swift
//  Promotr
//
//  Created by Mac on 3/28/23.
//

import Foundation
struct AddPromoCodeModel : Codable {
    let errors:Bool?
    let data:PrData?
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decodeIfPresent(Bool.self, forKey: .errors)
        data = try values.decodeIfPresent(PrData.self, forKey: .data)
    }
    
    
}
struct PrData : Codable {
   
    let promocodes:promocodeDetails?
    enum CodingKeys: String, CodingKey {
        case promocodes = "promocode"
    }
    init(from decoder: Decoder) throws {
        let values = try  decoder.container(keyedBy: CodingKeys.self)
        promocodes = try values.decodeIfPresent(promocodeDetails.self, forKey: .promocodes)
    }
}
struct promocodeDetails : Codable {

    let title:String?
    let description:String?
    let code_id:String?
    let store_name:String?
    let store_website_url:String?
    let discount_amount:String?
    let expiry_date:String?
    let category_id:String?
    let promoter_id:Int?
    let id:Int?
    let full_image_url:String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case code_id = "code_id"
        case store_name = "store_name"
        case store_website_url = "store_website_url"
        case discount_amount = "discount_amount"
        case expiry_date = "expiry_date"
        case category_id = "category_id"
        case promoter_id = "promoter_id"
        case id = "id"
        case full_image_url = "full_image_url"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        code_id = try values.decode(String.self, forKey: .code_id)
        store_name = try values.decode(String.self, forKey: .store_name)
        store_website_url = try values.decode(String.self, forKey: .store_website_url)
        discount_amount = try values.decode(String.self, forKey: .discount_amount)
        expiry_date = try values.decode(String.self, forKey: .expiry_date)
        category_id = try values.decode(String.self, forKey: .category_id)
        promoter_id = try values.decode(Int.self, forKey: .promoter_id)
        id = try values.decode(Int.self, forKey: .id)
        full_image_url = try values.decode(String.self, forKey: .full_image_url)
    }
}

/*
 {
     "errors": false,
     "data": {
         "promocode": {
             "title": "Test Promo Code",
             "description": "PromoCode for nike store",
             "code_id": "NIKE22AED",
             "store_name": "Nike",
             "store_website_url": "https://nike.ae/store",
             "discount_amount": "100",
             "expiry_date": "2023-08-29T00:00:00.000000Z",
             "type": "open",
             "category_id": "1",
             "promoter_id": 44,
             "updated_at": "2023-03-28T06:36:21.000000Z",
             "created_at": "2023-03-28T06:36:21.000000Z",
             "id": 14,
             "full_image_url": null
         }
     }
 }
 */
