//
//  UserViewModel.swift
//  Promotr
//
//  Created by Mac on 2/6/23.
//

import Foundation
class UserViewModel {
    
    static let instanse = UserViewModel()
    func validation(model:UserView) -> (Bool,String)
    {
        var status = true
        var error = "Please enter all the field"
        if model.email?.isEmpty ?? false
        {
            status = false
            error = "pls enter your email"
        }else if model.password?.isEmpty ?? false
        {
            status = false
            error = "pls enter your password"
        }
        return (status,error)
    }
    
}
