//
//  FavoriteViewModel.swift
//  Promotr
//
//  Created by Mac on 2/8/23.
//

import Foundation
class FavoriteViewModel {
    
    var items = [FavoriteModel]()
    //Api Json Data
    var itemJSON = [["code":"12D63EEFF","discount": "10% of Blabla","companyname":"Addidas"],["code":"13D63EEFF","discount": "13% of Blabla","companyname":"Nike"],["code":"14D63EEFF","discount": "14% of Blabla","companyname":"Addidas"],["code":"12D63EEFF","discount": "10% of Blabla","companyname":"Addidas"],["code":"12D63EEFF","discount": "10% of Blabla","companyname":"Nike"],["code":"12D63EEFF","discount": "10% of Blabla","companyname":"Addidas"],["code":"12D63EEFF","discount": "10% of Blabla","companyname":"Nike"],["code":"12D63EEFF","discount": "10% of Blabla","companyname":"Addidas"]]
    
    init() {
        self.items = FavoriteModel.modelFromDictionaryArray(array: itemJSON as NSArray)
        print("Items count", items.count)
    }
    
}
