//
//  ResetPasswordViewModel.swift
//  Promotr
//
//  Created by Mac on 2/21/23.
//
import UIKit
import Foundation
class ResetPasswordViewModel:NSObject {
    
    static let Instanse = ResetPasswordViewModel()
    class func validateResetPasswordDetails(viewController:ResetPassword, completion: @escaping () -> Void) {
        if viewController.emailTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.EMAIL_ENTER, view: viewController)
        }
        completion()
    }
    class func resetPasswordApi(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (ResetPasswordModel?) -> Void) {
        ServiceHandler.postApiRequest(url: forgot_password, viewcontroller: viewController, dict: parameters as! [String : Any]) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(ResetPasswordModel.self, from: responseData)
//MARK: Use below line when parsing with SiftyJSON
                print(responseData)
                
                if userData.errors == false {
                   
                    //LoginVM.saveLoginDetails(customerDetails: responseObject!) {}
                    completion(userData)
                }else {
                    print("Error")
                    CommonMethods.showAlertMessage(title: Constant.TITLE, message:Constant.ISSUE, view: viewController)
                }
              
            }
        }
    }
}
