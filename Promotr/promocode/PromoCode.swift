//
//  PromoCode.swift
//  Promotr
//
//  Created by Mac on 2/14/23.
//
import UIKit
//import Charts
class PromoCode: UIViewController {
    
    @IBOutlet weak var storeTF: UITextField!
    @IBOutlet weak var promoCodeTF: UITextField!
    @IBOutlet weak var termAndConditionTextview: UITextView!
    @IBOutlet weak var expireDateLable: UILabel!
    @IBOutlet weak var favroiteBtn: UIButton!
    var id:Int?
    var promoCodeDetailsModel:PromoCodeModel?
    var newFavoritePromoCode:newFavoritePromoCode?
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryDetails()
        print(id)
    }
    @IBAction func copyButtonAction(_ sender: Any) {
        
        UIPasteboard.general.string = promoCodeTF.text!
        self.showToast(message: "Code Copy!", font: UIFont.systemFont(ofSize: 13.0))
    }
    @IBAction func openLinkButtonAction(_ sender: UIButton) {
    }
    @IBAction func StarButtonAction(_ sender: UIButton) {
        if favroiteBtn.isSelected == false
        {
            if (UserDefaults.standard.string(forKey: "userid") != nil)
            {
                saveAsFevApi()
                favroiteBtn.isSelected = true
                favroiteBtn.setImage(UIImage(named: "fav_selected"), for: .normal)
            }
            else
            {
                CommonMethods.showAlertMessage(title:Constant.TITLE, message:Constant.PLS_LOGIN, view: self)
            }
            
        }
    }
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func categoryDetails(){
        var param = [String:Any]()
        param = ["id":id ?? 0]
        PromoCodeViewModel.callApiFromPromoCodeDetails(viewController: self, parameters:param as NSDictionary ) {
            responseObject in
            self.promoCodeDetailsModel = responseObject
            self.promoCodeTF.text = self.promoCodeDetailsModel?.promoDetails?.promocodesData?.code_id
            let Date = self.promoCodeDetailsModel?.promoDetails?.promocodesData?.expiry_date
            self.termAndConditionTextview.text = self.promoCodeDetailsModel?.promoDetails?.promocodesData?.description
            let newDateFormat = self.formatDate(date: Date ?? "")
            print(newDateFormat)
            self.expireDateLable.text = newDateFormat
            print("Get Data SuccessFully")
        }
    }
    func saveAsFevApi()
    {
        let id  = self.promoCodeDetailsModel?.promoDetails?.promocodesData?.id
        let param = ["promocode_id":id ?? 0]
        print(param)
        PromoCodeViewModel.saveAsFev(viewController: self, parameters: param as  NSDictionary) { responseObject in
            self.promoCodeDetailsModel = responseObject
            print("save Fev")
        }
    }
    //======= Date formater ====
    func formatDate(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMM yyyy"
        let dateObj: Date? = dateFormatterGet.date(from: date)
        return dateFormatter.string(from: dateObj!)
    }
}
