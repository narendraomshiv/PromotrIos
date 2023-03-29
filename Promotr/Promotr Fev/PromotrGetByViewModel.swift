//
//  PromotrGetByViewModel.swift
//  Promotr
//
//  Created by Mac on 3/29/23.
//

import Foundation
import UIKit
class PromotrGetByViewModel : NSObject {
    static let shareInstance = PromotrGetByViewModel()
    class func callGetProterbyIdApi(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (PromotrGetByModel?) -> Void) {
        let id = parameters["id"] as? Int
        let url = "\(id ?? 0)"
       
        ServiceHandler.alamofireGetRequestWithHeader(url:Get_PromoterByID+url,viewcontroller: viewController) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                print(Get_PromoterByID+url)
                let userData = try? JSONDecoder().decode(PromotrGetByModel.self, from: responseData)
                //MARK: Use below line when parsing with SiftyJSON
                print(responseData)
                if userData?.errors == false {
                    //LoginVM.saveLoginDetails(customerDetails: responseObject!) {}
                    completion(userData)
                }else {
                   // CommonMethods.showAlertMessage(title: Constant.TITLE, message: userData.errors ?? Constant.ISSUE, view: viewController)
                }
                     
            }
        }
        
    }
    class func userFevPromotr(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (userPromotrFev?) -> Void) {
        print(user_Fev_Promotr)
        ServiceHandler.alamofireGetRequestWithHeader(url:user_Fev_Promotr,viewcontroller: viewController) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(userPromotrFev.self, from: responseData)
                //MARK: Use below line when parsing with SiftyJSON
                print(responseData)
                if userData.errors == false {
                    //LoginVM.saveLoginDetails(customerDetails: responseObject!) {}
                    completion(userData)
                }else {
                   // CommonMethods.showAlertMessage(title: Constant.TITLE, message: userData.errors ?? Constant.ISSUE, view: viewController)
                }
                     
            }
        }
        
    }
}
