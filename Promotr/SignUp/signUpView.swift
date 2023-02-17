//
//  signUpView.swift
//  Promotr
//
//  Created by Mac on 2/7/23.
//

import Foundation
import UIKit
class signUpView
{
    var countryName:String?
    var name:String?
    var lastName:String?
    var email:String?
    var gender:String?
    var dob:String?
    var country:String?
    var password:String?
    var confirmPassword:String?
    
    
    init(name:String,lastName:String,email:String,gender:String,dob:String,country:String,password:String,confirmPassword:String) {
        self.name = name
        self.lastName = lastName
        self.email = email
        self.gender = gender
        self.dob = dob
        self.country = country
        self.password = password
        self.confirmPassword = confirmPassword
    }
    init(countryName:String) {
        self.countryName = countryName
    }
    init(dictonary:NSDictionary)
    {
        countryName = dictonary["Country"] as? String
    }
    public class func modelFromDicrotryArray(array:NSArray) -> [signUpView]
    {
        var mydata = [signUpView]()
        for i in array
        {
            mydata.append(signUpView(dictonary: i as! NSDictionary))
        }
        return mydata
    }
}

