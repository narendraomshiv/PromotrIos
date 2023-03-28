//
//  OnGoingViewModel.swift
//  Promotr
//
//  Created by Mac on 2/15/23.
//

import Foundation
import UIKit
class OnGoingViewModel:NSObject {
    
    static let ShareInstanse = FavoriteViewModel()
    class func getPromoCode(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (OngoingView?) -> Void) {
        
        ServiceHandler.alamofireGetRequestWithHeader(url:Create_PromoCode,viewcontroller: viewController) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                
                let userData = try? JSONDecoder().decode(OngoingView.self, from: responseData)
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
}
