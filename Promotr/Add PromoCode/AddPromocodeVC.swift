//
//  AddPromocodeVC.swift
//  Promotr
//
//  Created by Mac on 2/9/23.
//

import UIKit

class AddPromocodeVC: UIViewController {

    
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var cencelBtn: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cencelBtn.layer.cornerRadius = 20
        applyButton.layer.cornerRadius = 20
        cencelBtn.layer.borderWidth = 1.5
        cencelBtn.layer.borderColor = #colorLiteral(red: 0.9549533725, green: 0.4820566773, blue: 0.2470209897, alpha: 1)
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
    }
    @IBAction func cencelButtonAction(_ sender: UIButton) {
    }
    
   

}
