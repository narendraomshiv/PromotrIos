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
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var descriptions: UILabel!
    @IBOutlet weak var mobileNumer: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    var profileModel : ProfileModel?
    var updateProfileModel: UpdateProfileModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDesign()
        if (UserDefaults.standard.string(forKey: "userid") != nil)
        {
            getUserprofileData()
        }
        else
        {
            CommonMethods.showAlertMessage(title:Constant.TITLE, message:Constant.ASK_LOGIN, view: self)
        }
        nameTF.isUserInteractionEnabled = false
        emailTF.isUserInteractionEnabled = false
        descriptions.isUserInteractionEnabled = false
        mobileNumer.isUserInteractionEnabled = false
        passwordTF.isUserInteractionEnabled = false
        confirmPasswordTF.isUserInteractionEnabled = false
        
    }
  func UIDesign()
  {
    becomePromoOwner.layer.cornerRadius = 20
    nameView.layer.cornerRadius = 20
    nameView.layer.borderWidth = 0.2
    nameView.layer.shadowRadius = 10
    nameView.layer.shadowColor = UIColor.systemGray2.cgColor
    nameView.layer.shadowOpacity = 5
    becomePromoOwner.setTitle(NSLocalizedString("PromoOwner", comment: ""), for: .normal)
  }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func fristNamePencil(_ sender: UIButton) {
        nameTF.isUserInteractionEnabled = true
        descriptions.isUserInteractionEnabled = true
        nameTF.resignFirstResponder()
    }
    @IBAction func emailPencil(_ sender: UIButton) {
        emailTF.isUserInteractionEnabled = true
        emailTF.resignFirstResponder()
    }
    @IBAction func phonePencil(_ sender: UIButton) {
        mobileNumer.isUserInteractionEnabled = true
        mobileNumer.resignFirstResponder()
    }
    @IBAction func passwordPencil(_ sender: UIButton) {
        passwordTF.isUserInteractionEnabled = true
    }
    @IBAction func confirmPencil(_ sender: UIButton) {
        confirmPasswordTF.isUserInteractionEnabled = true
        confirmPasswordTF.isUserInteractionEnabled = true
    }
    @IBAction func settingBtnAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SettingVC") as! SettingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func BecomePromoOwnerBtnAction(_ sender: UIButton) {
        
        if (UserDefaults.standard.string(forKey: "userid") != nil)
        {
            let param = ["first_name":self.nameTF.text ?? Constant.BLANK, "mobile_number":mobileNumer.text ?? Constant.BLANK]
                print(param)
                ProfileViewModel.putUpdateProfile(viewController: self, parameters: param as NSDictionary) { responseObject in
                    self.updateProfileModel = responseObject
                    CommonMethods.showAlertMessage(title: Constant.TITLE, message:"Profile Update Succcessfully...!", view: self)
                }
        }
        else
        {
            CommonMethods.showAlertMessage(title:Constant.TITLE, message:Constant.ASK_LOGIN, view: self)
        }
        
        let vc = self.storyboard?.instantiateViewController(identifier: "PromoterSignUp") as! PromoterSignUp
        UserDefaults.standard.removeObject(forKey: "userid")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getUserprofileData()
    {
        let param = [String:Any]()
        ProfileViewModel.callProfileApi(viewController: self, parameters:param as NSDictionary ) {
            responseObject in
            self.profileModel = responseObject
            let name = self.profileModel?.data?.userDetails?.first_name
//            let lname = self.profileModel?.data?.userDetails?.last_name
            self.nameTF.text = name
            self.mobileNumer.text = self.profileModel?.data?.userDetails?.mobile_number
            self.emailTF.text = self.profileModel?.data?.userDetails?.email
            print("Get Data SuccessFully")
        }
    }
    
    
}
