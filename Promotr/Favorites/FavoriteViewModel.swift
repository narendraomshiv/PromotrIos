//
//  FavoriteViewModel.swift
//  Promotr
//
//  Created by Mac on 2/8/23.
//

import Foundation
import UIKit
class FavoriteViewModel:NSObject {
    
    static let ShareInstanse = FavoriteViewModel()
    class func favoriteApi(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (FavoriteModel?) -> Void) {
        
        ServiceHandler.alamofireGetRequestWithHeader(url:favorite,viewcontroller: viewController) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(FavoriteModel.self, from: responseData)
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
