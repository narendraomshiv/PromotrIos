//
//  PromoCodeModel.swift
//  Promotr
//
//  Created by Mac on 3/13/23.
//

import Foundation
struct PromoCodeModel : Codable {
    let errors : Bool?
    var promoDetails : promoCodeDetails?
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case promoDetails = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        promoDetails = try values.decodeIfPresent(promoCodeDetails.self, forKey: .promoDetails
        )
    }
}
struct promoCodeDetails : Codable {
    var promocodesData : promoCodeData?
    
    enum CodingKeys: String, CodingKey {
        case promocodesData = "promocode"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        promocodesData = try values.decodeIfPresent(promoCodeData.self, forKey: .promocodesData)
    }
    
}
struct promoCodeData : Codable {
    var id:Int?
    var title:String?
    var description:String?
    var code_id:String?
    var expiry_date:String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case code_id = "code_id"
        case expiry_date = "expiry_date"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        code_id = try values.decodeIfPresent(String.self, forKey: .code_id)
        expiry_date = try values.decodeIfPresent(String.self, forKey: .expiry_date)

    }
}

//==== Post Fev Model
struct PostFevModel : Codable {
   
    let errors:Bool?
    var data:fevData?
    
    enum CodingKeys : String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decodeIfPresent(Bool.self, forKey: .errors)
        data  = try values.decodeIfPresent(fevData.self, forKey: .data)
    }
}
struct fevData : Codable {
    var newFavoritePromoCodes:newFavoritePromoCode?
    enum CodingKeys : String, CodingKey {
        case newFavoritePromoCodes = "newFavoritePromoCode"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
 
        newFavoritePromoCodes  = try values.decodeIfPresent(newFavoritePromoCode.self, forKey: .newFavoritePromoCodes)
    }
}

struct newFavoritePromoCode : Codable {
    
    let promo_code_id:Int?
    let user_id:Int?
    let id:Int?
    
    enum CodingKeys : String, CodingKey {
        case promo_code_id = "promo_code_id"
        case user_id = "user_id"
        case id = "id"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        promo_code_id  = try values.decodeIfPresent(Int.self, forKey: .promo_code_id)
        user_id  = try values.decodeIfPresent(Int.self, forKey: .user_id)
        id  = try values.decodeIfPresent(Int.self, forKey: .id)
    }
}
/*
 {
     "errors": false,
     "data": {
         "newFavoritePromoCode": {
             "user_id": 10,
             "promo_code_id": 1,
             "updated_at": "2023-03-22T07:17:39.000000Z",
             "created_at": "2023-03-22T07:17:39.000000Z",
             "id": 7
         }
  
 */
