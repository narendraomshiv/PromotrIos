//
//  PromoterSignUp.swift
//  Promotr
//
//  Created by Mac on 2/9/23.
//

import UIKit
import Photos
class PromoterSignUp: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var instagramLinkTF: UITextField!
    @IBOutlet weak var faceBookLinkTF: UITextField!
    @IBOutlet weak var aboutTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var countryCodeLbl: UILabel!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var myimageView: UIImageView!
    @IBOutlet weak var uiImage: UITextField!
    var promoterModel:PromotrSignUpModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        uiImage.isUserInteractionEnabled = false
        signUpBtn.layer.cornerRadius = 20
        signUpBtn.setTitle(NSLocalizedString("SignUp", comment: ""), for: .normal)
    }
    @IBAction func backpButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func uploadImageButton(_ sender: UIButton) {
        let picker = UIImagePickerController()
               picker.delegate = self
               picker.sourceType = .savedPhotosAlbum
               self.present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let img = info[.originalImage]as? UIImage{
                myimageView.image = img
                uiImage.text = "Image Uploaded"
            }
            self.dismiss(animated: true, completion: nil)
        }
    @IBAction func promoterSignupButtonAction(_ sender: UIButton) {
     
        PromoterSignUpViewModel.validateFields(viewController: self) { (responseObject) in
            self.promoterModel = responseObject
          let user_id = self.promoterModel?.data?.promoterInformation?.id
            UserDefaults.standard.setValue(user_id, forKey: "Promoter_id")
            UserDefaults.standard.removeObject(forKey: "userid")

            let vc = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
       
    }
    }
    //===== Image Picker Code
    



//func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
// if let asset = info[UIImagePickerController.InfoKey.phAsset.rawVlue] as? PHAsset {
//       if let fileName = (asset.value(forKey: "filename")) as? String {
//         print(fileName)
//       }
//   }
// dismiss(animated: true, completion: nil)
//}
