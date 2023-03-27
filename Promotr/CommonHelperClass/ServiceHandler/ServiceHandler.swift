//
//  ServiceHandler.swift
//  Shamsaha
//
//  Created by Narendra Kumar on 06/02/23.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import KRProgressHUD
class ServiceHandler: NSObject {
    
    typealias completion = ((Data?, NSDictionary?)->())
    var onApiFetchCompleted: (Int)?
    class func alamofireGetRequestWithOutParameters(urlString:String, viewcontroller : UIViewController!,completion: @escaping completion){
        KRProgressHUD.show(withMessage: Constant.PROGRESS_TITLE)
        if  CommonMethods.isInternetAvailable() == true {
            AF.request(urlString, method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
                switch(response.result) {
                case .success(let value):
                    if let data = value as? [String:Any]{
                        completion(response.data, data as NSDictionary)
                    }
                case .failure(let error):
                    print(error)
                    CommonMethods.showAlertMessage(title: Constant.BLANK, message: (error.localizedDescription), view: viewcontroller)
                }
//                KRProgressHUD.dismiss()
            }
        }else {
            KRProgressHUD.dismiss()
            CommonMethods.showAlertMessage(title: Constant.BLANK, message: Constant.MESSAGE_NETWORK, view: viewcontroller)
        }
    }
    
    class func alamofireGetRequest(urlString:String, viewcontroller : UIViewController!,completion: @escaping completion){
//        KRProgressHUD.show(withMessage: Constant.PROGRESS_TITLE)
        
        if  CommonMethods.isInternetAvailable() == true {
            AF.request(urlString, method: .get, parameters: [Constant.BLANK:Constant.BLANK], encoding: URLEncoding.default, headers: nil).responseJSON { response in
                let statusCode = response.response?.statusCode
                switch(response.result) {
                case .success(let value):
                    if statusCode == 200
                    {
                        if let data = value as? [String:Any]{
                        completion(response.data, data as NSDictionary)
                        }
                    }
                    else if statusCode == 401 {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                    else if statusCode == 422 {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                    else if statusCode == 500 {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                    else {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                case .failure(let error):
                    print(error)
                    CommonMethods.showAlertMessage(title: Constant.BLANK, message: (error.localizedDescription), view: viewcontroller)
                }
//                KRProgressHUD.dismiss()
            }
        }else {
//            KRProgressHUD.dismiss()
            CommonMethods.showAlertMessage(title: Constant.BLANK, message: Constant.MESSAGE_NETWORK, view: viewcontroller)
        }
    }
    
    /**
     @developer: pkram
     @discussion: function to call the service for Post Request
     @paramters:  (urlString:String, param:[String:Any],viewcontroller : UIViewController!,completion: @escaping ( _ data: JSON?,  _ error: NSError?, NSDictionary?)->Void)
     @return: Nil
     */
    class func alamofirePostRequest(urlString:String, param:[String:Any],viewcontroller : UIViewController!,completion: @escaping ( _ data: JSON?,  _ error: NSError?, NSDictionary?)->Void){
        print(urlString)
//        KRProgressHUD.show(withMessage: Constant.PROGRESS_TITLE)
        if  CommonMethods.isInternetAvailable() == true {
            AF.request(urlString, method: .post, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON { response in
                KRProgressHUD.dismiss()
                
                switch(response.result) {
                case .success(let value):
                    if let data = value as? [String:Any] {
                        let json = JSON(data)
                        print(json)
                        completion(json, nil,data as NSDictionary)
                    }
                case .failure(let value):
                    print(value)
                    
                    if let data = value as? [String:Any] {
                        let json = JSON(data)
                        print(json)
                        completion(json, nil,data as NSDictionary)
                    }
                    
                  //  CommonMethods.showAlertMessage(title: Constant.BLANK, message: (error.localizedDescription), view: viewcontroller)
                }
                /*
                switch(response.result) {
                case .success(let value):
                    if let data = value as? [String:Any] {
                        let json = JSON(data)
                        print(json)
                        completion(json, nil,data as NSDictionary)
                    }
                case .failure(let error):
                    print(error)
                    CommonMethods.showAlertMessage(title: Constant.BLANK, message: (error.localizedDescription), view: viewcontroller)
                }
                */
//                KRProgressHUD.dismiss()
            }
        }else{
//            KRProgressHUD.dismiss()
            CommonMethods.showAlertMessage(title: Constant.BLANK, message: Constant.MESSAGE_NETWORK, view: viewcontroller)
        }
    }
    
    
    /**
     @developer: pkram
     @discussion: function to call the service for Post Request
     @paramters:  (urlString:String, param:[String:Any],viewcontroller : UIViewController!,completion: @escaping ( _ data: JSON?,  _ error: NSError?, NSDictionary?)->Void)
     @return: Nil
     */
    class func postApiRequest(url:String, viewcontroller : UIViewController!, dict: [String : Any], runLoader : Bool? = true, completion:@escaping completion) {
        if CommonMethods.isInternetAvailable() == true {
//            KRProgressHUD.show(withMessage: Constant.PROGRESS_TITLE)
            AF.request(url, method: .post, parameters: dict, encoding: JSONEncoding.default, headers: nil) .responseJSON { response in
                KRProgressHUD.dismiss()
                switch(response.result){
                case .success(let value):
                    let statusCode = response.response?.statusCode
                    if statusCode == 200 {
                        if let data = value as? [String:Any] {
                            completion(response.data, data as NSDictionary)
                        }
                    }
                    else if statusCode == 401 {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                    else if statusCode == 422 {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                    else {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                
                case .failure(let error):
                    print(error)
                    CommonMethods.showAlertMessage(title: Constant.BLANK, message: Constant.VALID_EMAIL, view: viewcontroller)
                }
            }
        } else {
            CommonMethods.showAlertMessage(title: Constant.BLANK, message: Constant.MESSAGE_NETWORK, view: viewcontroller)
        }
    }
    //============= Put Api with Header  ======
    class func putApiRequest(url:String, viewcontroller : UIViewController!,encoding: JSONEncoding, dict: [String : Any], runLoader : Bool? = true, completion:@escaping completion) {
        if CommonMethods.isInternetAvailable() == true {
//            KRProgressHUD.show(withMessage: Constant.PROGRESS_TITLE)
            AF.request(url, method: .put, parameters: dict,encoding: URLEncoding(destination: .queryString), headers: ServiceHandler.headerParam()) .responseJSON { response in
//                KRProgressHUD.dismiss()
                switch(response.result) {
                case .success(let value):
                    let statusCode = response.response?.statusCode
                    if statusCode == 200 {
                        if let data = value as? [String:Any] {
                            completion(response.data, data as NSDictionary)
                        }
                    }
                    else if statusCode == 401 {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                    else if statusCode == 405 {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                    else if statusCode == 422 {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                    else {
                        let result = response.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                case .failure(let error):
                    print(error)
                    CommonMethods.showAlertMessage(title: Constant.BLANK, message: (error.localizedDescription), view: viewcontroller)
                }
//                KRProgressHUD.dismiss()
            }
        } else {
            CommonMethods.showAlertMessage(title: Constant.BLANK, message: Constant.MESSAGE_NETWORK, view: viewcontroller)
        }
    }
    
    
    
    /**
     @developer: pkram
     @discussion: function to call the service for Post Request
     @paramters:  (urlString:String, param:[String:Any],viewcontroller : UIViewController!,completion: @escaping ( _ data: JSON?,  _ error: NSError?, NSDictionary?)->Void)
     @return: Nil
     */
    class func alamofirePostRequestWithHeader(url:String, viewcontroller : UIViewController!, dict: [String : Any], runLoader : Bool? = true, completion:@escaping completion) {
        if CommonMethods.isInternetAvailable() == true {
            //            KRProgressHUD.show(withMessage: Constant.PROGRESS_TITLE)
                        AF.request(url, method: .post, parameters: dict, encoding: JSONEncoding.default, headers: ServiceHandler.headerParam()) .responseJSON { response in
                            KRProgressHUD.dismiss()
                            switch(response.result){
                            case .success(let value):
                                let statusCode = response.response?.statusCode
                                if statusCode == 200 {
                                    if let data = value as? [String:Any] {
                                        completion(response.data, data as NSDictionary)
                                    }
                                }
                                else if statusCode == 401 {
                                    let result = response.value! as! [String : Any]
                                    CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                                }
                                else if statusCode == 422 {
                                    let result = response.value! as! [String : Any]
                                    CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                                }
                                else {
                                    let result = response.value! as! [String : Any]
                                    CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                                }
                            
                            case .failure(let error):
                                print(error)
                                CommonMethods.showAlertMessage(title: Constant.BLANK, message: (error.localizedDescription), view: viewcontroller)
                            }
                        }
                    } else {
            CommonMethods.showAlertMessage(title: Constant.BLANK, message: Constant.MESSAGE_NETWORK, view: viewcontroller)
        }
    }
    //  ========= Put Method ==========
    class func alamofirePutRequestWithHeader(url:String, viewcontroller : UIViewController!, dict: [String : Any], runLoader : Bool? = true, completion:@escaping completion) {
        if CommonMethods.isInternetAvailable() == true {
//            KRProgressHUD.show(withMessage: Constant.PROGRESS_TITLE)
            AF.request(url, method: .put, parameters: dict, encoding: JSONEncoding.default, headers: ServiceHandler.headerParam()) .responseJSON { response in
//                KRProgressHUD.dismiss()
                switch(response.result) {
                case .success(let value):
                    if let data = value as? [String:Any] {
                        completion(response.data, data as NSDictionary)
                    }
                case .failure(let error):
                    print(error)
                    CommonMethods.showAlertMessage(title: Constant.BLANK, message: (error.localizedDescription), view: viewcontroller)
                }
//                KRProgressHUD.dismiss()
            }
        } else {
            CommonMethods.showAlertMessage(title: Constant.BLANK, message: Constant.MESSAGE_NETWORK, view: viewcontroller)
        }
    }
    
    
    
    /**
     @developer: pkram
     @discussion: function to call the service for get JSON response
     @paramters:  (urlString:String, viewcontroller : UIViewController!,completion: @escaping ( _ data: JSON?,  _ error: NSError?)->Void)
     @return: Nil
     */
    class func alamofireGetRequestWithHeader(url:String, viewcontroller : UIViewController!, completion:@escaping completion) {
//        KRProgressHUD.show(withMessage: Constant.PROGRESS_TITLE)
        if  CommonMethods.isInternetAvailable() == true {
            AF.request(url, method: .get, parameters: [Constant.BLANK:Constant.BLANK], encoding: URLEncoding.default, headers: ServiceHandler.headerParam()).responseJSON { response in
                switch(response.result) {
                case .success(let value):
                    if let data = value as? [String:Any]{
                        completion(response.data, data as NSDictionary)
                    }
                case .failure(let error):
                    print(error)
                    CommonMethods.showAlertMessage(title: Constant.BLANK, message: (error.localizedDescription), view: viewcontroller)
                }
//                KRProgressHUD.dismiss()
            }
        }else {
//            KRProgressHUD.dismiss()
            CommonMethods.showAlertMessage(title: Constant.BLANK, message: Constant.MESSAGE_NETWORK, view: viewcontroller)
        }
    }
    
    /**
     @developer: pkram
     @discussion: function to call the service for upload image in multipart
     @paramters:  (urlmethod: String, parameter: [String: Any], userImage: Data!,imageName: String,fileType: String, viewcontroller : UIViewController!, completion:@escaping completion)
     @return: Nil
     */
    class func alamofireUploadImage(urlmethod: String, parameter: [String: Any], userImage: Data!,imageName: String,fileType: String, viewcontroller : UIViewController!, completion:@escaping completion) {
        
//        KRProgressHUD.show(withMessage: Constant.PROGRESS_TITLE)
        if CommonMethods.isInternetAvailable() == true {
            AF.upload(multipartFormData: { multipartFormData in
                for (key, value) in parameter {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                }
                
                let imageData = userImage
                //"image/jpeg"
                if fileType == "image/jpeg" {
                    if let data = imageData {
                        multipartFormData.append(data, withName: imageName, fileName: "imageName" + ".jpeg", mimeType: fileType)
                    }
                } else {
                    if let data = imageData {
                        multipartFormData.append(data, withName: imageName, fileName: "imageName" + ".pdf", mimeType: fileType)
                    }
                }
            }, to: urlmethod, method: .post, headers: ServiceHandler.headerParam()).responseJSON { responseObject in
                switch(responseObject.result) {
                case .success(let value):
                    let statusCode = responseObject.response?.statusCode
                    if statusCode == 200 {
                        if let data = value as? [String:Any] {
                            completion(responseObject.data, data as NSDictionary)
                        }
                    }
                    else if statusCode == 401 {
                        let result = responseObject.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                    else if statusCode == 422 {
                        let result = responseObject.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                    else {
                        let result = responseObject.value! as! [String : Any]
                        CommonMethods.showAlertMessage(title: Constant.TITLE, message: result["message"] as! String, view: viewcontroller)
                    }
                
                case .failure(let error):
                    print(error)
                    CommonMethods.showAlertMessage(title: Constant.BLANK, message: (error.localizedDescription), view: viewcontroller)
                }
            }
        } else {
//            KRProgressHUD.dismiss()
            CommonMethods.showAlertMessage(title: Constant.BLANK, message: Constant.MESSAGE_NETWORK, view: viewcontroller)
        }
    }
    class func headerParam() -> HTTPHeaders {
        var headerParam = HTTPHeaders()
        headerParam["Authorization"] = "Bearer \(String(SessionManager.sharedInstance.accessToken ?? Constant.BLANK))"
        
//        headerParam["Authorization"] = "Bearer \(String("13|JQ8r7oWXq2gUsGCjhgUgnl2j74gLHU7C3fwm8VZx"))"
        
        return headerParam
    }
}
