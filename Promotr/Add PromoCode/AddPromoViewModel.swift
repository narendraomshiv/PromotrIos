//
//  AddPromoViewModel.swift
//  Promotr
//
//  Created by Mac on 3/28/23.
//

import Foundation
import UIKit

class AddPromoViewModel:NSObject {
    class func validateLoginDetails(viewController:AddPromocodeVC, completion: @escaping () -> Void) {
        if viewController.nameTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.All_FIELD, view: viewController)
        }
        else if viewController.valueTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.All_FIELD, view: viewController)
            
        }
        else if viewController.storeLink.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.All_FIELD, view: viewController)
        }
        else if viewController.storeNameTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.All_FIELD, view: viewController)
        }
        else if viewController.categoryTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.All_FIELD, view: viewController)
        }
        else if viewController.termandConditions.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.All_FIELD, view: viewController)
        }
        else if viewController.validDateTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.All_FIELD, view: viewController)
        }
        else if viewController.code_Id.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.All_FIELD, view: viewController)
        }
        else if viewController.typeTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.All_FIELD, view: viewController)
        }
        else{
            completion()
        }
        completion()
    }
    static let instanse = UserViewModel()
    class func callLoginWS(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (AddPromoCodeModel?) -> Void) {
        ServiceHandler.alamofirePostRequestWithHeader(url: Create_PromoCode, viewcontroller: viewController, dict: parameters as! [String : Any]) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                let userData = try? JSONDecoder().decode(AddPromoCodeModel.self, from: responseData)
                //MARK: Use below line when parsing with SiftyJSON
                print(responseData)
                if userData?.errors == false {
                    CommonMethods.showAlertMessage(title: Constant.TITLE, message:"", view: viewController)
                    completion(userData)
                }else if userData?.errors == true {
                    CommonMethods.showAlertMessage(title: Constant.TITLE, message:"", view: viewController)
                }
            }
        }
    }
}
