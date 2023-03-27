//
//  SignUpVC.swift
//  Promotr
//
//  Created by Mac on 2/7/23.
//

import UIKit

class SignUpVC: UIViewController,ContryNameCode {
    
    
    
    
    @IBOutlet weak var fristNameView: UIView!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var dateOfBirthView: UIView!
    
    @IBOutlet weak var countryview: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var SignUpBtn: UIButton!
    @IBOutlet weak var coutryDeopBtn: UIButton!
    @IBOutlet weak var datePopUpView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    //TF
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
     @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var countryCodeTF: UITextField!
    @IBOutlet weak var MobilenumberTF: UITextField!
    @IBOutlet weak var genderDropDown: UIView!
    @IBOutlet weak var male: UIButton!
    @IBOutlet weak var female: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    var SignupModel:SignupModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDesign()
        signUpButton.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
        
    }
    func countryDidSelect(country: String, code: String) {
        countryTF.text = country
        countryCodeTF.text = code
    }
    
    @objc func dateSelected() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: datePicker.date)
        dateOfBirth.text = date
    }
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func countryDropDownbuttonAction(_ sender: UIButton) {
        let vc =  self.storyboard?.instantiateViewController(identifier: "CountryVC") as! CountryVC
        vc.delegate = self
//        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
      
    }
    @IBAction func calenderButtonAction(_ sender: UIButton) {
        datePopUpView.isHidden = false
    }
    @IBAction func genderDropButtonAction(_ sender: UIButton) {
        if genderDropDown.isHidden == false
        {
            genderDropDown.isHidden = true
        }
        else
        {
            genderDropDown.isHidden = false
        }
    }
   
    @IBAction func maleButtonAction(_ sender: UIButton) {
        genderDropDown.isHidden = true
        genderTF.text = "male"
    }
    @IBAction func femaleButtonAction(_ sender: UIButton) {
        genderDropDown.isHidden = true
        genderTF.text = "female"
    }
    @IBAction func otherButtonAction(_ sender: UIButton) {
        genderDropDown.isHidden = true
        genderTF.text = "other"
    }
    
    @IBAction func signUpBtnAction(_ sender: UIButton) {
        let deviceName = UUID().uuidString
        print(deviceName)
        SignUpViewModel.validateSignUpDetails(viewController: self) {
            let param =  ["first_name": self.nameTF.text ?? Constant.BLANK, "last_name": self.lastNameTF.text ?? Constant.BLANK, "email": self.emailTF.text ?? Constant.BLANK,"mobile_number": "\(self.countryCodeTF.text ?? "")" + "\(self.MobilenumberTF.text ?? "")", "gender":self.genderTF.text ?? Constant.BLANK, "date_of_birth":self.dateOfBirth.text ?? Constant.BLANK, "country": self.countryTF.text ?? Constant.BLANK, "password": self.passwordTF.text ?? Constant.BLANK, "password_confirmation": self.confirmPasswordTF.text ?? Constant.BLANK,"device_name":"\(deviceName)","has_accepted_terms":true] as [String : Any]
            print(param)
                SignUpViewModel.callSignUpWS(viewController: self, parameters: param as NSDictionary) { (responseObject) in
                    self.SignupModel = responseObject
                    let vc = self.storyboard?.instantiateViewController(identifier: "VerifyOtpCode") as! VerifyOtpCode
                    vc.mobileNumber = "\(self.countryCodeTF.text ?? "")"+"\(self.MobilenumberTF.text ?? "")"
                    self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    func UIDesign()
    {
        fristNameView.layer.cornerRadius = 20
        lastNameView.layer.cornerRadius = 20
        emailView.layer.cornerRadius = 20
        genderView.layer.cornerRadius = 20
        dateOfBirthView.layer.cornerRadius = 20
        countryview.layer.cornerRadius = 20
        passwordView.layer.cornerRadius = 20
        confirmPasswordView.layer.cornerRadius = 20
        SignUpBtn.layer.cornerRadius = 20
        datePopUpView.isHidden = true
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.tintColor = .link
        datePicker.maximumDate = Date()
    }
    @IBAction func okDatePickerButtonAction(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: datePicker.date)
        dateOfBirth.text = date
        datePopUpView.isHidden = true
    }
    
    @IBAction func cancelDatePickerButtonAction(_ sender: UIButton) {
        datePopUpView.isHidden = true
        dateOfBirth.text = ""
    }
    
}
