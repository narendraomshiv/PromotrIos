//
//  PromoCode.swift
//  Promotr
//
//  Created by Mac on 2/14/23.
//

import UIKit
import Charts
class PromoCode: UIViewController {

    @IBOutlet weak var storeTF: UITextField!
    @IBOutlet weak var promoCodeTF: UITextField!
    @IBOutlet weak var termAndConditionTextview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func copyButtonAction(_ sender: Any) {
        
        UIPasteboard.general.string = promoCodeTF!.text
    }
    @IBAction func openLinkButtonAction(_ sender: UIButton) {
    }
    @IBAction func StarButtonAction(_ sender: UIButton) {
    }
    @IBAction func backButtonAction(_ sender: UIButton) {
    }
   

}
