//
//  LoginModel.swift
//  Shamsaha
//
//  Created by Narendra Kumar on 06/02/23.
//



import Foundation

struct LoginModel : Codable {
    let errors : Bool?
    let token : String?
    var objLoginDataModel : LoginData?
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case token = "token"
        case objLoginDataModel = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        objLoginDataModel = try values.decodeIfPresent(LoginData.self, forKey: .objLoginDataModel)
    }
}
struct LoginData : Codable {
    let access_token : String?
    var userDataModel : UserData?
    enum CodingKeys: String, CodingKey {
        case access_token = "access_token"
        case userDataModel = "user"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        access_token = try values.decodeIfPresent(String.self, forKey: .access_token)
        userDataModel = try values.decodeIfPresent(UserData.self, forKey: .userDataModel
        )
    }
}
struct UserData : Codable {
    let id : Int?
    let first_name : String?
    let last_name : String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case first_name = "first_name"
        case last_name = "last_name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
    }
}

