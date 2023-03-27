//
//  CommonMethods.swift
//  Shamsaha
//
//  Created by Narendra Kumar on 06/02/23.
//

import Foundation
import UIKit
import SystemConfiguration
import CoreData
import SwiftyJSON

class CommonMethods: NSObject {
    
    /**
     @developer: Pkram
     @description: Method used for email validation
     @parameters:  (_ email: String)
     @returns:Bool
     */
    
    class func isvalidate(YourEMailAddress: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: YourEMailAddress)
    }
   
    /**
     @developer: Pkram
     @description: Method used for go to next controller
     @parameters:  (storyboard:UIStoryboard, identifier:String, navigation:UINavigationController)
     @returns:Nil
     */
    class func goToViewController(storyboard:UIStoryboard, identifier:String, navigation:UINavigationController) {
        let objVC = storyboard.instantiateViewController(withIdentifier: identifier)
        navigation.pushViewController(objVC, animated: true)
    }
    
    /**
     @developer: Pkram
     @description: Method used for show alert message
     @parameters:  (title: String, message: String, view: UIViewController)
     @returns:Nil
     */
    class func showAlertMessage(title: String, message: String, view: UIViewController) {
        let objAlert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
            //Do some other stuff
        }
        objAlert.addAction(nextAction)
        view.present(objAlert, animated: true, completion: nil)
    }
    class func showAlertMessageWithHandler(title: String, message: String, view: UIViewController, completion: @escaping () -> Void) {
        let objAlert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { action -> Void in
            //Do some other stuff
            completion()
        }
        objAlert.addAction(nextAction)
        view.present(objAlert, animated: true, completion: nil)
    }
    /**
     @developer: Pkram
     @description: This method will be used for Check Internet Connection.
     @parameter: Nil
     @returns:Bool value
     */
    //  MARK:-
    //  MARK:-  Check Internet Connection
    class func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
}
