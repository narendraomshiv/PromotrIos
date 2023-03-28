//
//  SettingVC.swift
//  Promotr
//
//  Created by Mac on 2/9/23.
//

import UIKit

class SettingVC: UIViewController {

    
    @IBOutlet weak var switchButton: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButton.layer.cornerRadius = 15
        switchButton.layer.borderWidth = 1
        switchButton.layer.borderColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        switchButton.transform = CGAffineTransform(scaleX: 1.0, y: 0.65)
    }
    
    @IBAction func backButttonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func termConditonButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func SignOutButtonAction(_ sender: UIButton) {
        
        ShowAlert()
    }
    @IBAction func deleteAccountButtonAction(_ sender: UIButton) {
        ShowAlert()
    }
    
    func ShowAlert()
    {
        let alert = UIAlertController(title: "LogOut", message: "Are you sure", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "yes", style: .default, handler: { (UIAlertAction) in
            let vc = self.storyboard?.instantiateViewController(identifier: "FristPage") as! FristPage
            UserDefaults.standard.removeObject(forKey: "skip")
            UserDefaults.standard.removeObject(forKey: "userid")
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
