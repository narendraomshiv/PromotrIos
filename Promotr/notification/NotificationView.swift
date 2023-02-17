//
//  NotificationView.swift
//  Promotr
//
//  Created by Mac on 2/8/23.
//

import Foundation
class NotificationView {
    
    var notificationTitle:String?
    var notificationTime:String?
    
    init(notificationTitle:String,notificationTime:String) {
        self.notificationTitle = notificationTitle
        self.notificationTime = notificationTime
    }
    init(dictonary:NSDictionary) {
        self.notificationTitle = dictonary["Title"] as? String
        self.notificationTime = dictonary["Time"] as? String
    }
    // Put Api Json Data in Structure
    
    public class func modelViewDictionaryData(array:NSArray) -> [NotificationView]
    {
        var items = [NotificationView]()
        for data in array
        {
            items.append(NotificationView(dictonary: data as! NSDictionary))
        }
        return items
    }
}
