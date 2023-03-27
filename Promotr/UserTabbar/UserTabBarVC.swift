//
//  UserTabBarVC.swift
//  Promotr
//
//  Created by Mac on 2/7/23.
//

import UIKit

class UserTabBarVC: UITabBarController {

    
    @IBOutlet weak var tabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.layer.shadowOffset = CGSize(width: 10, height: 10)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 20
        tabBar.layer.borderWidth = 0.3
    }
    

   
}
