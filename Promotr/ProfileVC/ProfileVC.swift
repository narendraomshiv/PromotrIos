//
//  ProfileVC.swift
//  Promotr
//
//  Created by Mac on 2/8/23.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var becomePromoOwner: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDesign()
    }
  func UIDesign()
  {
    becomePromoOwner.layer.cornerRadius = 20
    nameView.layer.cornerRadius = 20
    nameView.layer.borderWidth = 0.2
    nameView.layer.shadowRadius = 10
    nameView.layer.shadowColor = UIColor.systemGray2.cgColor
    nameView.layer.shadowOpacity = 5
  }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func settingBtnAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SettingVC") as! SettingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func BecomePromoOwnerBtnAction(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(identifier: "PromoterSignUp") as! PromoterSignUp
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
