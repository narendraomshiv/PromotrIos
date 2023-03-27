//
//  UserViewModel.swift
//  Promotr
//
//  Created by Mac on 2/6/23.
//
import UIKit
import Foundation
import CoreData
class UserViewModel: NSObject {
    
    class func validateLoginDetails(viewController:LoginVC, completion: @escaping () -> Void) {
        if viewController.emaiTextField.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.EMAIL_ENTER, view: viewController)
        }
        else if viewController.passwordTextField.text?.count ?? 0<=0 {
            CommonMethods.showAlertMessage(title: Constant.TITLE, message: Constant.PASSWORD_VALIDATION, view: viewController)
            
        }else{
            completion()
        }
        completion()
    }
    static let instanse = UserViewModel()
    
    class func callLoginWS(viewController:UIViewController, parameters:NSDictionary, completion: @escaping (LoginModel?) -> Void) {
        ServiceHandler.postApiRequest(url: login_url, viewcontroller: viewController, dict: parameters as! [String : Any]) { (responseObject, responseDict)  in
            if let responseData = responseObject {
                let userData = try! JSONDecoder().decode(LoginModel.self, from: responseData)
                //MARK: Use below line when parsing with SiftyJSON
                print(responseData)
                if userData.errors == false {
                    UserViewModel.saveLoginDetails(customerDetails: responseObject!){}
                    completion(userData)
                }else if userData.errors == true {
                    CommonMethods.showAlertMessage(title: Constant.TITLE, message:"Invalid Credital,Please try again!", view: viewController)
                }
            }
        }
    }
    //    save Data in Core Data
    class func saveLoginDetails(customerDetails:Data, completion: @escaping () -> Void) {
        //**** Save all entity into core data ****//
        guard let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            return
        }
        let entity = NSEntityDescription.entity(forEntityName: "UserMyData",
                                                in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        person.setValue(customerDetails, forKey: "loginMyData")
        do {
            try managedContext.save()
            print("Data Saved guruJi")
            completion()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
