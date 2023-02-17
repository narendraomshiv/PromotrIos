//
//  FavoriteModel.swift
//  Promotr
//
//  Created by Mac on 2/8/23.
//

import Foundation
import UIKit
class FavoriteModel {
    
    var productImage:UIImage?
    var code:String?
    var discount:String?
    var CompanyLogo:UIImage?
    var CompanyName:String?
    
    init(productImage:UIImage, code:String,discount:String,CompanyLogo:UIImage,CompanyName:String) {
        self.productImage = productImage
        self.code = code
        self.discount = discount
        self.CompanyLogo = CompanyLogo
        self.CompanyName = CompanyName
    }
    init(dictionary : NSDictionary) {
        self.code = dictionary["code"] as? String
        self.CompanyName = dictionary["companyname"] as? String
        self.discount = dictionary["discount"] as? String
    }
    // Put Api Data in Model/Structure
//    call this Function in ViewModel
    public class func modelFromDictionaryArray(array: NSArray) -> [FavoriteModel]
    {
        var items = [FavoriteModel]()
        for data in array
        {
            items.append(FavoriteModel(dictionary: data as! NSDictionary))
        }
        return items
    }
}
