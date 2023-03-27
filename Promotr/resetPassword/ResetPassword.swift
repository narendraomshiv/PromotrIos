//
//  ResetPassword.swift
//  Promotr
//
//  Created by Mac on 2/15/23.
//

import UIKit

class ResetPassword: UIViewController { 
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    var resetModel:ResetPasswordModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.layer.cornerRadius = 20
    }    
    @IBAction func resetButtonAction(_ sender: UIButton) {
        ResetPasswordViewModel.validateResetPasswordDetails(viewController: self) {
            let param = ["email":self.emailTF.text ?? Constant.BLANK]
        ResetPasswordViewModel.resetPasswordApi(viewController: self, parameters: param as NSDictionary) { responseObject in
            self.resetModel = responseObject
            print("successFully Done ")
//            self.navigationController?.popViewController(animated: true)
            let alert = UIAlertController(title: Constant.TITLE, message:"Please check your email to reset your password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style:.default, handler: { (action) in
                let vc = self.storyboard?.instantiateViewController(identifier: "VerifyOtpCode") as! VerifyOtpCode
                self.navigationController?.pushViewController(vc, animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
           
        }
    }
    }
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
