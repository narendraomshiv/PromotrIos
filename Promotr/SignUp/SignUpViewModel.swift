//
//  SignUpViewModel.swift
//  Promotr
//
//  Created by Mac on 2/9/23.
//

import Foundation
import UIKit
class SignUpViewModel:NSObject {
    
    static let instanse = SignUpViewModel()
    class func validateSignUpDetails(viewController:SignUpVC, completion: @escaping () -> Void) {
        if viewController.nameTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.FRIST_NAME, view: viewController)
        }
        else if viewController.lastNameTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.LAST_NAME, view: viewController)
        }
        else if viewController.MobilenumberTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.PHONE_NUMBER_VALIDATION, view: viewController)
        }
        else if viewController.countryTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.SELECT_COUNTRY, view: viewController)
        }
        else if viewController.countryCodeTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.SELECT_COUNTRYCODE, view: viewController)
        }
        else if viewController.genderTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.SELECT_GENDER, view: viewController)
        }
        else if viewController.emailTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.EMAIL_ENTER, view: viewController)
        }
        else if viewController.dateOfBirth.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.ENTER_DOB, view: viewController)
            
        }
        else if viewController.confirmPasswordTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.PASSWORD_VALIDATION, view: viewController)
        }
        else if viewController.passwordTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.PASSWORD_VALIDATION, view: viewController)
            
        }
        else if viewController.passwordTF.text !=  viewController.confirmPasswordTF.text {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.PASSWORD_NOT_MATCH, view: viewController)
            
        }
        else{
            completion()
        }
        
        completion()
    }
    class func callSignUpWS(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (SignupModel?) -> Void)
    {
        ServiceHandler.postApiRequest(url: sign_up, viewcontroller: viewController, dict: parameters as! [String : Any]) { (responseObject, responseDict) in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(SignupModel.self, from: responseData)
                //MARK: Use below line when parsing with SiftyJSON
                print(responseData)
                if userData.errors == false {
                    //LoginVM.saveLoginDetails(customerDetails: responseObject!) {}
                    completion(userData)
                }else {
                    // CommonMethods.showAlertMessage(title: Constant.TITLE, message: userData.status ?? Constant.ISSUE, view: viewController)
                }
            }
        }
    }

    
}
