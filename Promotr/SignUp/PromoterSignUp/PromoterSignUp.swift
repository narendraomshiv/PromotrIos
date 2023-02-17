//
//  PromoterSignUp.swift
//  Promotr
//
//  Created by Mac on 2/9/23.
//

import UIKit

class PromoterSignUp: UIViewController {

    @IBOutlet weak var instagramLinkTF: UITextField!
    @IBOutlet weak var faceBookLinkTF: UITextField!
    @IBOutlet weak var aboutTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var countryCodeLbl: UILabel!
    @IBOutlet weak var signUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBtn.layer.cornerRadius = 20
       
    }
    @IBAction func backpButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func promoterSignupButtonAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
  

}
