//
//  FavoriteModel.swift
//  Promotr
//
//  Created by Mac on 2/8/23.
//

import Foundation
import UIKit
struct FavoriteModel : Codable {
    let errors:Bool?
    var data:userFavoritData?
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decodeIfPresent(userFavoritData.self, forKey: .data)
    }
}
struct userFavoritData : Codable {
    var favoritePromoCode:[favoritePromoCodes]?
    
    enum CodingKeys: String, CodingKey {
        case favoritePromoCode = "favoritePromoCodes"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
       
        favoritePromoCode = try values.decodeIfPresent([favoritePromoCodes].self, forKey: .favoritePromoCode)
    }
    
}
struct favoritePromoCodes : Codable {
    let id:Int?
    let title:String?
    let description:String?
    let code_id:String?
    let discount_amount:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case code_id = "code_id"
        case discount_amount = "discount_amount"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        code_id = try values.decode(String.self, forKey: .code_id)
        discount_amount = try values.decode(String.self, forKey: .discount_amount)
    }
}

/*
 {
     "errors": false,
     "data": {
         "favoritePromoCodes": [
             {
                 "id": 1,
                 "title": "Test",
                 "description": "THis is a test promocode",
                 "code_id": "PROS22@",
                 "discount_amount": "50.00",
                 "discount_amount_ceiling": null,
                 "expiry_date": "2023-04-08T00:00:00.000000Z",
                 "type": "open",
                 "category_id": 1,
                 "brand_store_id": null,
                 "influencer_id": null,
                 "created_at": "2023-03-13T16:10:03.000000Z",
                 "updated_at": "2023-03-13T16:10:03.000000Z",
                 "pivot": {
                     "user_id": 2,
                     "promo_code_id": 1
                 }
             }
         ]
     }
 }
 */
