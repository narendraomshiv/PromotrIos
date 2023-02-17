//
//  SearchViewModel.swift
//  Promotr
//
//  Created by Mac on 2/16/23.
//

import Foundation
class SearchViewModel {
    
    var category = [SearchView]()
    var discount = [SearchView]()
    
    //Api Json Data
    var discountJSON = [["discount":"10"],["discount":"50"],["discount":"40"],["discount":"30"],["discount":"20"]]
    var CategoryJSON = [["category":"A"],["category":"B"],["category":"C"],["category":"D"],["category":"E"]]
   
    init() {
        self.category = SearchView.modelFromDirectoryArray(array: (CategoryJSON as NSArray))
        self.discount = SearchView.modelFromDirectoryArray(array: (discountJSON as NSArray))
        print(category.count)
    }
 
}
