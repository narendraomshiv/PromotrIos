//
//  CategioryViewModel.swift
//  Promotr
//
//  Created by Mac on 3/2/23.
//

import Foundation
import UIKit
class CategioryViewModel:NSObject {
    
    static let ShareInstanse = CategioryViewModel()
    class func callCategoryApi(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (CategorieModel?) -> Void) {
        
        ServiceHandler.alamofireGetRequest(urlString:Category_url,viewcontroller: viewController) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(CategorieModel.self, from: responseData)
                
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
    
    //PromoCode of the Day APi
    
    class func CallPromoCodeOfTheDayApi(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (PromoData?) -> Void) {
        
        ServiceHandler.alamofireGetRequest(urlString:promoCodeOftheDay_url,viewcontroller: viewController) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(PromoData.self, from: responseData)
                
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
