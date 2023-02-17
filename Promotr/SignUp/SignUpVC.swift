//
//  SignUpVC.swift
//  Promotr
//
//  Created by Mac on 2/7/23.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var fristNameView: UIView!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var dateOfBirthView: UIView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var SignUpBtn: UIButton!
    @IBOutlet weak var coutryDeopBtn: UIButton!
    @IBOutlet weak var countryCodeTableView: UITableView!
    @IBOutlet weak var datePopUpView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    //TF
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
     @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    var viewModel:SignUpViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDegine()
        viewModel = SignUpViewModel()
        let nib = UINib(nibName: "CountryCell", bundle: nil)
        countryCodeTableView.register(nib, forCellReuseIdentifier: "cell")
        
//        datePicker.minimumDate = Date()
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
        if  countryCodeTableView.isHidden == false
        {
        countryCodeTableView.isHidden = true
        }
        else
        {
            countryCodeTableView.isHidden = false
        }
    }
    @IBAction func calenderButtonAction(_ sender: UIButton) {
        datePopUpView.isHidden = false
    }
    @IBAction func signUpBtnAction(_ sender: UIButton) {
        CheckValidation()
        
    }
    func UIDegine()
    {
        fristNameView.layer.cornerRadius = 20
        lastNameView.layer.cornerRadius = 20
        emailView.layer.cornerRadius = 20
        genderView.layer.cornerRadius = 20
        dateOfBirthView.layer.cornerRadius = 20
        countryView.layer.cornerRadius = 20
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
    
    func CheckValidation()
    {
        let (status,error) = SignUpViewModel.instanse.validation(model: signUpView(name: nameTF.text!, lastName: lastNameTF.text!, email: emailTF.text!, gender:genderTF.text! , dob:dateOfBirth.text!, country: countryTF.text!, password: passwordTF.text!, confirmPassword: confirmPasswordTF.text!))
        if status{
            let alert = UIAlertController(title: "", message: "Successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (UIAlertAction) in
                let vc = self.storyboard?.instantiateViewController(identifier: "VerifyEmailVc") as! VerifyEmailVc
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
extension SignUpVC:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.data.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryCodeTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryCell
        cell.setDataInTableView(Model: (viewModel?.items[indexPath.row])!)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let countryName = viewModel?.items[indexPath.row].countryName
        self.countryTF.text = countryName ?? ""
        countryCodeTableView.isHidden = true
       
    }
    
}
