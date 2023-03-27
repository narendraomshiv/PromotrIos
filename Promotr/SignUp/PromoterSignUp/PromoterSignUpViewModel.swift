//
//  PromoterSignUpViewModel.swift
//  Promotr
//
//  Created by Mac on 2/9/23.
//

import Foundation
import UIKit
class PromoterSignUpViewModel: NSObject {
    static let shareInstance = PromoterSignUpViewModel()
    class func validateSignUpDetails(viewController:PromoterSignUp, completion: @escaping () -> Void) {
        if viewController.instagramLinkTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.FRIST_NAME, view: viewController)
        }
        else if viewController.aboutTF.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.LAST_NAME, view: viewController)
        }
        else if viewController.uiImage.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.PHONE_NUMBER_VALIDATION, view: viewController)
        }
        else{
            completion()
        }
        
        completion()
    }
    class func callUpdateProfileWS(viewController:UIViewController, parameters:NSDictionary, image:Data, imageName:String, completion: @escaping (PromotrSignUpModel) -> Void)
    {
        ServiceHandler.alamofireUploadImage(urlmethod: become_a_promoter, parameter: parameters as! [String : Any], userImage: image, imageName: imageName, fileType: "image/jpeg", viewcontroller: viewController) { (responseObject, responseDict) in
            if let responseData = responseObject {
                
                let userData = try! JSONDecoder().decode(PromotrSignUpModel.self, from: responseData)
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
    class func validateFields(viewController:PromoterSignUp, completion: @escaping (PromotrSignUpModel) -> Void) {
//        if viewController.aboutTF.text?.count == 0 {
//            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.About, view: viewController)
//        }
//        else if viewController.instagramLinkTF.text?.count == 0 {
//            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.INSTAGRAM_LINK, view: viewController)
//        }
//        else if viewController.myimageView == nil {
//            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.Image_Url, view: viewController)
//        }
//        else {
            let param = ["about":viewController.aboutTF.text ?? Constant.BLANK,
                         "instagram_profile_url":viewController.instagramLinkTF.text ?? Constant.BLANK,"facebook_profile_url":viewController.faceBookLinkTF.text ?? ""]
            print(param)
            let imageData = viewController.myimageView.image?.jpegData(compressionQuality: 0.8)!
        print(imageData)
            PromoterSignUpViewModel.callUpdateProfileWS(viewController: viewController, parameters: param as NSDictionary, image: imageData!, imageName: "profile_image") { (responseObject) in
                CommonMethods.showAlertMessageWithHandler(title: Constant.TITLE, message:"signUp SuccessFully", view: viewController) {
                    completion(responseObject)
                }
                
                completion(responseObject)
            }
        }
    }
    
    
    
//}
