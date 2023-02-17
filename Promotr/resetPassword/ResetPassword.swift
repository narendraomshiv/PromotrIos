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
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.layer.cornerRadius = 20
    }    
    @IBAction func resetButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
