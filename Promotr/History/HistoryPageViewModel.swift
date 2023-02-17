//
//  HistoryPageViewModel.swift
//  Promotr
//
//  Created by Mac on 2/13/23.
//

import Foundation
class HistoryPageViewModel {
    
    var data =  [HistoryPageView]()
    
    let itemJson = [["companyName":"Nike","discount":"10% of Balbla","promoCode":"1235FFD"],["companyName":"Addidas","discount":"15% of Balbla","promoCode":"1235FFD"],["companyName":"Addidas","discount":"10% of Balbla","promoCode":"1235FFD"]]
    
    init() {
        self.data = HistoryPageView.modelFromDictionaryArray(array: (itemJson as NSArray))
    }
}
