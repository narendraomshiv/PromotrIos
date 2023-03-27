//
//  ProfileModel.swift
//  Promotr
//
//  Created by Mac on 3/20/23.
//

import Foundation
struct ProfileModel : Codable {
    let errors:Bool?
    var data:userProfileData?
    
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case data = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        data = try values.decodeIfPresent(userProfileData.self, forKey: .data
        )
    }
}
struct userProfileData : Codable {
    var userDetails:DetailsOfUser?
    enum CodingKeys: String, CodingKey {
        case userDetails = "user"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userDetails = try values.decodeIfPresent(DetailsOfUser.self, forKey: .userDetails)
    }
}
struct DetailsOfUser : Codable {
    let id:Int?
    let first_name:String?
    let last_name:String?
    let email:String?
    let mobile_number:String?
    let date_of_birth:String?
    let gender:String?
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case mobile_number = "mobile_number"
        case date_of_birth = "date_of_birth"
        case gender = "gender"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        first_name = try values.decode(String.self, forKey: .first_name)
        last_name = try values.decode(String.self, forKey: .last_name)
        email = try values.decode(String.self, forKey: .email)
        mobile_number = try values.decode(String.self, forKey: .mobile_number)
        date_of_birth = try values.decode(String.self, forKey: .date_of_birth)
        gender = try values.decode(String.self, forKey: .gender)
    }
}


struct UpdateProfileModel : Codable {
    let errors:Bool?
    var profile:ProfileData?
    enum CodingKeys: String, CodingKey {
        case errors = "errors"
        case profile = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode(Bool.self, forKey: .errors)
        profile = try values.decodeIfPresent(ProfileData.self, forKey: .profile
        )
    }
    
}
struct ProfileData : Codable {
    var UpdateuserDetails:userResult?
    enum CodingKeys: String, CodingKey {
        case UpdateuserDetails = "user"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        UpdateuserDetails = try values.decodeIfPresent(userResult.self, forKey: .UpdateuserDetails
        )
    }
    
}
struct userResult : Codable {
    let id:Int?
    let first_name:String?
    let last_name:String?
    let email:String?
    let mobile_number:String?
    let date_of_birth:String?
    let gender:String?
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case first_name = "first_name"
        case last_name = "last_name"
        case email = "email"
        case mobile_number = "mobile_number"
        case date_of_birth = "date_of_birth"
        case gender = "gender"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        first_name = try values.decode(String.self, forKey: .first_name)
        last_name = try values.decode(String.self, forKey: .last_name)
        email = try values.decode(String.self, forKey: .email)
        mobile_number = try values.decode(String.self, forKey: .mobile_number)
        date_of_birth = try values.decode(String.self, forKey: .date_of_birth)
        gender = try values.decode(String.self, forKey: .gender)
    }
}

/*
 "id": 1,
 "first_name": "Test",
 "last_name": "test",
 "email": "salhanijad@gmail.com",
 "country": "UAE",
 "gender": "male",
 "mobile_number": "+971566905018",
 "date_of_birth": "1993-01-09",
 "email_verified_at": null,
 "fcm_token": null,
 "device_name": "Postman",
 "locale": "en",
 "mobile_number_verified": false,
 "created_at": "2023-03-12T12:34:50.000000Z",
 "updated_at": "2023-03-12T12:34:50.000000Z"
 */
