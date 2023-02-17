//
//  VerifyEmailVc.swift
//  Promotr
//
//  Created by Mac on 2/7/23.
//

import UIKit

class VerifyEmailVc: UIViewController {

    
    @IBOutlet weak var codeView: UIView!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var sumbitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        codeView.layer.cornerRadius = 20
        sumbitBtn.layer.cornerRadius = 20
        
    }
    
    @IBAction func crossBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sumbitBtnAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
