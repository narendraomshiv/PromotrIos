//
//  VerifyOtpModel.swift
//  Promotr
//
//  Created by Mac on 2/21/23.
//

import Foundation

struct VerifyOtpModel : Codable {
    let errors : Bool?
    let validateOtp : validateData?
    
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case validateOtp = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        validateOtp = try values.decodeIfPresent(validateData.self, forKey: .validateOtp
        )
    }
}

struct validateData : Codable {
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}
struct reSendOtp : Codable {
    let errors : Bool?
    let data:String?
    
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decodeIfPresent(String.self, forKey: .data)
    }
}
