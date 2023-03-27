//
//  SignupModel.swift
//  Promotr
//
//  Created by Mac on 2/20/23.
//

import Foundation
struct SignupModel : Codable
{
    let errors : Bool?
   // let tokens : String?
    let objsignUpData:signUpData?
    
    enum CodingKeys:String,CodingKey
    {
        case errors = "errors"
        //case tokens = "token"
        case objsignUpData = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        //tokens = try values.decode(String.self, forKey: .tokens)
        objsignUpData = try values.decode(signUpData.self, forKey: .objsignUpData)
    }
}


struct signUpData:Codable
{
    let access_token : String?
    var userDataModel:SignupUserData?
    
    enum CodingKeys: String, CodingKey {
        case access_token = "access_token"
        case userDataModel = "user"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        access_token = try values.decodeIfPresent(String.self, forKey: .access_token)
        userDataModel = try values.decodeIfPresent(SignupUserData.self, forKey: .userDataModel
        )
    }
}

struct SignupUserData : Codable {

    let id : Int?
    let first_name : String?
    let last_name : String?
    let email : String?
    let gender : String?
    let mobile_number : String?
    let country : String?
    let device_name : String?
    let date_of_birth : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case gender = "gender"
        case mobile_number = "mobile_number"
        case country = "country"
        case date_of_birth = "date_of_birth"
        case device_name = "device_name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        mobile_number = try values.decodeIfPresent(String.self, forKey: .mobile_number)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        date_of_birth = try values.decodeIfPresent(String.self, forKey: .date_of_birth)
        device_name = try values.decodeIfPresent(String.self, forKey: .device_name)
    }
}

