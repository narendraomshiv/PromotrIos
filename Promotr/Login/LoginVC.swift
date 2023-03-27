//
//  LoginVC.swift
//  Promotr
//
//  Created by Mac on 2/6/23.
//

import UIKit
class LoginVC: UIViewController {

    static let shareInstanse = LoginVC?.self
    @IBOutlet weak var containtView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emaiTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinBtn: UIButton!
    var accessToken:String?
    var deviceName:String?
    var loginmodel:LoginModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        containtView.layer.cornerRadius = 20
        emailView.layer.cornerRadius = 20
        passwordView.layer.cornerRadius = 20
        signinBtn.layer.cornerRadius = 20
        signinBtn.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
    }
         


    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func signInButtonAction(_ sender: UIButton) {
        let deviceName = UUID().uuidString
        print(deviceName)
        UserViewModel.validateLoginDetails(viewController: self) {
            let param = ["email":self.emaiTextField.text ?? Constant.BLANK,"password":self.passwordTextField.text  ?? Constant.BLANK,"device_name":"\(deviceName)"]
            print(param)
            UserViewModel.callLoginWS(viewController: self, parameters: param as NSDictionary) { responseObject in
                
                self.loginmodel = responseObject
                let id = self.loginmodel?.objLoginDataModel?.userDataModel?.id
                let access_token = self.loginmodel?.objLoginDataModel?.access_token
                print(access_token)
                self.accessToken = access_token
                UserDefaults.standard.setValue(access_token, forKey: "access_token")
                UserDefaults.standard.setValue(id, forKey: "userid")
                let vc = self.storyboard?.instantiateViewController(identifier: "UserTabBarVC") as! UserTabBarVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            }
        
    }
    @IBAction func forgetPasswordBtnAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ResetPassword") as! ResetPassword
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
