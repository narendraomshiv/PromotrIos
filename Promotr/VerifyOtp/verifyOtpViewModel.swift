//
//  verifyOtpViewModel.swift
//  Promotr
//
//  Created by Mac on 2/21/23.
//
import UIKit
import Foundation
class verifyOtpViewModel:NSObject {
    
    static let instanse = verifyOtpViewModel()
    
    class func verifyOtpApi(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (VerifyOtpModel?) -> Void) {
        ServiceHandler.postApiRequest(url: verify_Otp, viewcontroller: viewController, dict: parameters as! [String : Any]) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(VerifyOtpModel.self, from: responseData)
                
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
    class func resendOtpApi(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (reSendOtp?) -> Void) {
        ServiceHandler.postApiRequest(url: resendOTP, viewcontroller: viewController, dict: parameters as! [String : Any]) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(reSendOtp.self, from: responseData)
                
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
