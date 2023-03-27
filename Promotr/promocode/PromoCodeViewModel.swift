//
//  PromoCodeViewModel.swift
//  Promotr
//
//  Created by Mac on 3/13/23.
//

import Foundation
import UIKit
class PromoCodeViewModel: NSObject {
 
    static let ShareInstance = PromoCodeViewModel()
    
    class func callApiFromPromoCodeDetails(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (PromoCodeModel?) -> Void) {
        let id = parameters["id"] as? Int
        let url = "\(id ?? 0)"
        print(url)
        ServiceHandler.alamofireGetRequest(urlString:promoCodeDetailsPage+url,viewcontroller: viewController) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(PromoCodeModel?.self, from: responseData)
                
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
    class func saveAsFev(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (PromoCodeModel?) -> Void) {
        ServiceHandler.alamofirePostRequestWithHeader(url: favorite, viewcontroller: viewController, dict: parameters as! [String : Any]) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                let userData = try! JSONDecoder().decode(PromoCodeModel.self, from: responseData)
                //MARK: Use below line when parsing with SiftyJSON
                print(responseData)
                if userData.errors == false {
//                    UserViewModel.saveLoginDetails(customerDetails: responseObject!){}
                    completion(userData)
                }else if userData.errors == true {
                    CommonMethods.showAlertMessage(title: Constant.TITLE, message:"", view: viewController)
                }
            }
        }
    }
}
