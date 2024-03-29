//
//  OngoingView.swift
//  Promotr
//
//  Created by Mac on 2/15/23.
//

import Foundation
struct OngoingView : Codable {
    let errors:Bool?
    let data:PrmotrData?
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decodeIfPresent(PrmotrData.self, forKey: .data)
    }
    
    
}
struct PrmotrData : Codable {
   
    let promocode:[promocodeGetData]?
    enum CodingKeys: String, CodingKey {
        case promocode = "promocodes"
    }
    init(from decoder: Decoder) throws {
        let values = try  decoder.container(keyedBy: CodingKeys.self)
        promocode = try values.decodeIfPresent([promocodeGetData].self, forKey: .promocode)
    }
}
struct promocodeGetData : Codable {

    let title:String?
    let description:String?
    let code_id:String?
    let store_name:String?
    let store_website_url:String?
    let discount_amount:String?
    let expiry_date:String?
    let category_id:Int?
    let promoter_id:Int?
    let id:Int?
//    let full_image_url:String?
    
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
//        case full_image_url = "full_image_url"
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
        category_id = try values.decode(Int.self, forKey: .category_id)
        promoter_id = try values.decode(Int.self, forKey: .promoter_id)
        id = try values.decode(Int.self, forKey: .id)
//        full_image_url = try values.decode(String.self, forKey: .full_image_url)
    }
}
/*
 "errors": false,
     "data": {
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
