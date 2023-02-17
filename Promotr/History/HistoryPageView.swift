//
//  HistoryPageView.swift
//  Promotr
//
//  Created by Mac on 2/13/23.
//

import Foundation
import UIKit
class HistoryPageView {
    
    var productImage:UIImage?
    var companyImage:UIImage?
    var promoCode:String?
    var discount:String?
    var companyName:String?

    init(productImage:UIImage,companyImage:UIImage,promoCode:String,discount:String,companyName:String) {
        self.companyName = companyName
        self.discount = discount
        self.promoCode =  promoCode
    }
    //access data from View model
    init(dictonary:NSDictionary)
    {
        self.companyName = dictonary["companyName"] as? String
        self.discount = dictonary["discount"] as? String
        self.promoCode = dictonary["promoCode"] as? String
        
    }
    public class func modelFromDictionaryArray(array: NSArray) -> [HistoryPageView]
    {
        var items = [HistoryPageView]()
        for data in array
        {
            items.append(HistoryPageView(dictonary: data as! NSDictionary))
        }
        return items
    }
}
