//
//  ResetPasswordModel.swift
//  Promotr
//
//  Created by Mac on 2/21/23.
//

import Foundation
struct ResetPasswordModel:Codable {
    let errors : Bool?
    let resetDatas : resetData?
    
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case resetDatas = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        resetDatas = try values.decodeIfPresent(resetData.self, forKey: .resetDatas
        )
    }
}

struct resetData : Codable {
    
    let status:String?
    enum CodingKeys: String, CodingKey {
        case status = "status"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}
