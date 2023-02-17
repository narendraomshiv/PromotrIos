//
//  NotificationViewModel.swift
//  Promotr
//
//  Created by Mac on 2/8/23.
//

import Foundation
class NotificationViewModel {
    
    var items = [NotificationView]()
    // Api JSon Dummy  Data 
    var itemJSON = [["Title":"New Notification find Dummy text","Time":"1 hours Ago"],["Title":"New Notification find Dummy text","Time":"2 hours Ago"],["Title":"New Notification find Dummy text","Time":"8 hours Ago"],["Title":"Old Notification find Dummy text","Time":"8 hours Ago"],["Title":"New Notification find Dummy text","Time":"8 hours Ago"],["Title":"Old Notification find Dummy text","Time":"5 days Ago"],["Title":"New Notification find Dummy text","Time":"8 hours Ago"],["Title":"Old Notification find Dummy text","Time":"3 days Ago"],]
    
    init(){
        self.items = NotificationView.modelViewDictionaryData(array: itemJSON as NSArray)
        print(items.count)
    }
}
