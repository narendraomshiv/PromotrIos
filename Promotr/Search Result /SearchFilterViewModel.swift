//
//  SearchFilterViewModel.swift
//  Promotr
//
//  Created by Mac on 3/10/23.
//

import Foundation
import UIKit
class SearchFilterViewModel:NSObject {
    
    static let ShareInstace = SearchFilterViewModel()
    
    class func callApiFromCategoryPromoCode(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (SearchFilterView?) -> Void) {
        let id = parameters["id"] as? Int
        let url = "categories/\(id ?? 0)/promo-codes"
        print(url)
        ServiceHandler.alamofireGetRequest(urlString:cetogeryPromocode+url,viewcontroller: viewController) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(SearchFilterView?.self, from: responseData)
                
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
    class func callApiFromPromoCode(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (PromocodeDataModel?) -> Void) {
        let category_id = parameters["category_id"] as? Int
        let expiry_date = parameters["expiry_date"] as? String
        let discount_amount = parameters["discount_amount"] as? String
        let url = "discount_amount\(discount_amount ?? "0")&category_id\(category_id ?? 0)&expiry_date\(expiry_date ?? "0")"
        print(promoCodeBySearchFilter+url)
        ServiceHandler.alamofireGetRequest(urlString:promoCodeBySearchFilter+url,viewcontroller: viewController) { (responseObject, responseDict)  in
            if let responseData = responseObject {
               
                let userData = try! JSONDecoder().decode(PromocodeDataModel?.self, from: responseData)
                
                //MARK: Use below line when parsing with SiftyJSON
                print(responseData)
                
                if userData?.error == false {
                    //LoginVM.saveLoginDetails(customerDetails: responseObject!) {}
                    completion(userData)
                }else {
                   // CommonMethods.showAlertMessage(title: Constant.TITLE, message: userData.errors ?? Constant.ISSUE, view: viewController)
                }
              
            }
        }
        
    }
    
}
