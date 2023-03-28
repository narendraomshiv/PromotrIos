//
//  AddPromocodeVC.swift
//  Promotr
//
//  Created by Mac on 2/9/23.
//

import UIKit

class AddPromocodeVC: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var cencelBtn: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var categoryTF:UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var typeTable: UITableView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var termandConditions: UITextView!
    @IBOutlet weak var validDateTF: UITextField!
    @IBOutlet weak var storeLink: UITextField!
    @IBOutlet weak var storeNameTF: UITextField!
    @IBOutlet weak var code_Id: UITextField!
    @IBOutlet weak var valueTF: UITextField!
    @IBOutlet weak var typeTF: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateView: UIView!
    var typearr = ["Open","Close"]
    var categoriesModel:CategorieModel?
    var categoryId:Int?
    var promoModel:AddPromoCodeModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        cencelBtn.layer.cornerRadius = 20
        applyButton.layer.cornerRadius = 20
        cencelBtn.layer.borderWidth = 1.5
        cencelBtn.layer.borderColor = #colorLiteral(red: 0.9549533725, green: 0.4820566773, blue: 0.2470209897, alpha: 1)
        CategoriesApi()
        dateView.isHidden = true
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.tintColor = .link
        datePicker.minimumDate = Date()
        termandConditions.delegate = self
        termandConditions.text = "Text Here"
        termandConditions.textColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    
    
    @objc func dateSelected() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: datePicker.date)
        validDateTF.text = date
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if termandConditions.textColor == UIColor.lightGray {
            termandConditions.text = nil
            termandConditions.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if termandConditions.text.isEmpty {
            termandConditions.text = "Text Here"
            termandConditions.textColor = UIColor.lightGray
        }
    }
    @IBAction func categoryButtonAction(_ sender: UIButton) {
        if categoryTableView.isHidden == false
        {
            categoryTableView.isHidden = true
        }
        else
        {
            categoryTableView.isHidden = false
        }
    }
    @IBAction func typeButtonAction(_ sender: UIButton) {
        if typeTable.isHidden == false
        {
            typeTable.isHidden = true
        }
        else
        {
            typeTable.isHidden = false
        }
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
     title:Test Promo Code
     description:PromoCode for nike store
     code_id:NIKE22AED
     store_name:Nike
     store_website_url:https://nike.ae/store
     discount_amount:100
     expiry_date:29-08-2023
     type:open
     category_id:1
     */
    
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        AddPromoViewModel.validateLoginDetails(viewController: self) {
            let param = ["title":self.nameTF.text ?? Constant.BLANK,"description":self.termandConditions.text  ?? Constant.BLANK,"code_id":self.code_Id.text ?? Constant.BLANK,"store_name":self.storeNameTF.text ?? Constant.BLANK,"store_website_url":self.storeLink.text ?? Constant.BLANK,"discount_amount":self.valueTF.text ?? Constant.BLANK,"expiry_date":self.validDateTF.text ?? Constant.BLANK,"type":self.typeTF.text ?? Constant.BLANK,"category_id":self.categoryId ?? 0] as [String : Any]
            print(param)
            AddPromoViewModel.callLoginWS(viewController: self, parameters: param as NSDictionary) { responseObject in
                
                self.promoModel = responseObject
                
                print("PromoCode Create SuccessFully")
            }
            
            }
        
        
        
        
        
    }
    @IBAction func cencelButtonAction(_ sender: UIButton) {
    }
    @IBAction func calenderButtonAction(_ sender: UIButton) {
        dateView.isHidden = false
    }
    @IBAction func okDatePickerButtonAction(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: datePicker.date)
        validDateTF.text = date
        dateView.isHidden = true
    }
    
    @IBAction func cancelDatePickerButtonAction(_ sender: UIButton) {
        dateView.isHidden = true
        validDateTF.text = ""
    }
}
extension AddPromocodeVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == typeTable
        {
            return typearr.count
        }
        else
        {
            print((categoriesModel?.data?.cats?.count) ?? 0)
            return (categoriesModel?.data?.cats?.count) ?? 0
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == typeTable
        {
            let cell = typeTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TypeCell
            cell.typeTF.text = typearr[indexPath.row]
            return cell
        }
        else
        {
            let cell = categoryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryCell
            cell.categoryLbl.text = categoriesModel?.data?.cats?[indexPath.row].name
            categoryId = categoriesModel?.data?.cats?[indexPath.row].id
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if tableView == categoryTableView
        {
            let name = categoriesModel?.data?.cats?[indexPath.row].name
            self.categoryTF.text = name
            categoryTableView.isHidden = true
        }
        else
        {
            let name = typearr[indexPath.row]
            typeTF.text = name
            typeTable.isHidden = true
        }
    }
    func CategoriesApi()
    {
        let param = [String:Any]()
        CategioryViewModel.callCategoryApi(viewController: self, parameters:param as NSDictionary ) {
            responseObject in
            self.categoriesModel = responseObject
            print("Get Data SuccessFully")
            self.categoryTableView.reloadData()
        }
    }
}
