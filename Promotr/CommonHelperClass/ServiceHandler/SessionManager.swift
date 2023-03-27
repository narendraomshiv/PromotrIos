//
//  SessionManager.swift
//  Shamsaha
//
//  Created by Narendra Kumar on 06/02/23.
//

import UIKit

class SessionManager {
    
    static let sharedInstance = SessionManager()
    private init() {}
    var objLoginData: LoginModel?
    var str_Title: String?
    var str_FCM_Token: String?
    var int_OrderType : Int?
    var str_CategoryType : String?
    var str_ProviderId : Int?
    var accessToken = UserDefaults.standard.string(forKey: "access_token")
}
