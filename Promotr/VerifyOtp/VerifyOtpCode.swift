//
//  VerifyOtpCode.swift
//  Promotr
//
//  Created by Mac on 2/21/23.
//

import UIKit

class VerifyOtpCode: UIViewController {
    
    @IBOutlet weak var OtpTextField: UITextField!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var resendOtpButton: UIButton!
    var mobileNumber:String?
    var verifyModel:VerifyOtpModel?
    var reSendOtpModel:reSendOtp?
    var count = 600
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        resendOtpButton.isEnabled = false
        resendOtpButton.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        print(mobileNumber)
       Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
    }
    @IBAction func backButtonAction(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func resetButtonAction(_ sender: UIButton) {
        let param = ["otp_code":OtpTextField.text ?? Constant.BLANK, "mobile_number":mobileNumber ?? Constant.BLANK]
        print(param)
        verifyOtpViewModel.verifyOtpApi(viewController:self, parameters: param as NSDictionary) { responseObject in
            self.verifyModel = responseObject
            let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
            self.navigationController?.pushViewController(vc, animated: true)
            print("successFully")
        }
    }
    
    @IBAction func resendOtpButtonAction(_ sender: UIButton) {
       let param = ["mobile_number":mobileNumber ?? Constant.BLANK]
        verifyOtpViewModel.resendOtpApi(viewController: self, parameters: param as NSDictionary) { (responseObject) in
            self.reSendOtpModel = responseObject
            print("SuccessFully")
        }
        
    }
}
extension VerifyOtpCode {
    @objc func UpdateTime() {
        if(count >= 0){
                let minutes = String(count / 60)
                let seconds = String(count % 60)
                timeLable.text = minutes + ":" + seconds
                count -= 1
            }
        if(count == 0)
        {
            timer?.invalidate()
            resendOtpButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            resendOtpButton.isEnabled = true
        }
       }
   
   }
  
