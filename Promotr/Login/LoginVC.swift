//
//  LoginVC.swift
//  Promotr
//
//  Created by Mac on 2/6/23.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var containtView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emaiTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        containtView.layer.cornerRadius = 20
        emailView.layer.cornerRadius = 20
        passwordView.layer.cornerRadius = 20
        signinBtn.layer.cornerRadius = 20
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        CheckValidation()
        
    }
    @IBAction func forgetPasswordBtnAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ResetPassword") as! ResetPassword
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
// Check Validation of login page
    func CheckValidation()
    {
        let (status,error) = UserViewModel.instanse.validation(model: UserView(email: emaiTextField.text!, password: passwordTextField.text!) )
        if status{
            let alert = UIAlertController(title: "", message: "Successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (UIAlertAction) in
                let vc = self.storyboard?.instantiateViewController(identifier: "UserTabBarVC") as! UserTabBarVC
                self.navigationController?.pushViewController(vc, animated: true)
            }))
            self.present(alert, animated: true)
            
        }
        else
        {
            let alert = UIAlertController(title: "", message:error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            print(error)
        }
    }
}
