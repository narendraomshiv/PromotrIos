//
//  SearchFilterView.swift
//  Promotr
//
//  Created by Mac on 3/10/23.
//

import Foundation
struct SearchFilterView : Codable {
    let errors:Bool?
    let data:categoriesData?
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decodeIfPresent(categoriesData.self, forKey: .data
        )
    }
}
struct  categoriesData : Codable {
    var category:results?
   
    enum CodingKeys: String, CodingKey  {
        case category = "category"
      
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category = try values.decodeIfPresent(results.self, forKey: .category)
    }
}
struct results : Codable {
    let id:Int?
    let name:String?
    let description:String?
    let full_image_url:String?
    let promocodesDetails:[promocodes]?
    enum CodingKeys: String, CodingKey  {
        case id = "id"
        case name = "name"
        case description = "description"
        case full_image_url = "full_image_url"
        case promocodesDetails = "promocodes"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        full_image_url = try values.decode(String.self, forKey: .full_image_url)
        promocodesDetails = try values.decodeIfPresent([promocodes].self, forKey: .promocodesDetails)
    }

}
struct promocodes : Codable {
    let id:Int?
    let title:String?
    let description:String?
    let code_id:String?
    let discount_amount:String?
    let type:String?
    let category_id:Int?
    enum CodingKeys: String, CodingKey  {
        case id = "id"
        case title = "title"
        case description = "description"
        case code_id = "code_id"
        case discount_amount = "discount_amount"
        case type = "type"
        case category_id = "category_id"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        code_id = try values.decode(String.self, forKey: .code_id)
        discount_amount = try values.decode(String.self, forKey: .discount_amount)
        type = try values.decode(String.self, forKey: .type)
        category_id = try values.decode(Int.self, forKey: .category_id)
    }
}
// PromoCode Search then Call
struct PromocodeDataModel: Codable {
    let error:Bool?
    let Data:promoDataModel?
    
    enum CodingKeys: String, CodingKey {
        case error = "errors"
        case Data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try values.decode(Bool.self, forKey: .error)
        Data = try values.decodeIfPresent(promoDataModel.self, forKey: .Data
        )
    }
}
 
struct promoDataModel : Codable {
    let promoDetails: [PromoDetails]?
    enum CodingKeys: String, CodingKey {
         case promoDetails = "promocodes"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        promoDetails = try values.decodeIfPresent([PromoDetails].self, forKey: .promoDetails
        )
    }
}
struct PromoDetails : Codable {
    var id:Int?
    var title:String?
    var code_id:String?
    var description:String?
    
    enum CodingKeys: String, CodingKey {
    case id = "id"
    case title = "title"
    case code_id = "code_id"
    case description = "description"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        code_id = try values.decode(String.self, forKey: .code_id)
        description = try values.decode(String.self, forKey: .description)
    }
}
