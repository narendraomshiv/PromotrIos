//
//  SearchView.swift
//  Promotr
//
//  Created by Mac on 2/16/23.
//

import Foundation
class SearchView {
    
    var discount:String?
    var category:String?
    
    init(discount:String) {
        self.discount = discount
    }
    init(category:String) {
        self.category = category
    }
    init(dictonary:NSDictionary) {
        self.discount = dictonary["discount"] as? String
        self.category = dictonary["category"] as? String
    }
    
    public class func modelFromDirectoryArray(array:NSArray) -> [SearchView]
    {
       var item = [SearchView]()
        for data in array
        {
            item.append(SearchView(dictonary: data as! NSDictionary))
        }
        return item
    }
  
}
