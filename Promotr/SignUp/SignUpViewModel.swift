//
//  SignUpViewModel.swift
//  Promotr
//
//  Created by Mac on 2/9/23.
//

import Foundation
import UIKit
class SignUpViewModel {
    
    var items = [signUpView]()
    var data = [["Country":"India"],["Country":"itely"],["Country":"NewZeland"],["Country":"Pakistan"],["Country":"Austalia"],["Country":"USA"],["Country":"US"],["Country":"UK"],["Country":"South Africa"]]
    
    init() {
        self.items = signUpView.modelFromDicrotryArray(array: data as NSArray)
        print(items.count)
    }
    
    static let instanse = SignUpViewModel()
    func validation(model:signUpView) -> (Bool,String)
    {
        var status = true
        var error = "Please enter all the field"
        if model.name?.isEmpty ?? false
        {
            status = false
            error = "please enter your Name"
        }else if model.lastName?.isEmpty ?? false
        {
            status = false
            error = "please enter your lastName"
        }
        else if model.email?.isEmpty ?? false
        {
            status = false
            error = "please enter your email"
        }
        else if model.gender?.isEmpty ?? false
        {
            status = false
            error = "please enter your gender"
        }
        else if model.dob?.isEmpty ?? false
        {
            status = false
            error = "please select your dob"
        }
        else if model.country?.isEmpty ?? false
        {
            status = false
            error = "please select your country"
        }
        else if model.password?.isEmpty ?? false
        {
            status = false
            error = "please enter your dob"
        }
        else if model.confirmPassword?.isEmpty ?? false
        {
            status = false
            error = "please enter your Confirm Password"
        }
        return (status,error)
    }
    
    
}
