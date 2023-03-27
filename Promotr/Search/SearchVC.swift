//
//  SearchVC.swift
//  Promotr
//
//  Created by Mac on 2/16/23.
//

import UIKit

class SearchVC: UIViewController {

    
    @IBOutlet weak var discounttext: UILabel!
    @IBOutlet weak var searchStrore: UITextField!
    @IBOutlet weak var categorydropImage: UIImageView!
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var chooseText: UILabel!
    @IBOutlet weak var discountTableView: UITableView!
    @IBOutlet weak var discountDropImage: UIImageView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var discountTF: UITextField!
    @IBOutlet weak var dateLB: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var viewModel:SearchViewModel?
    var categoriesModel:CategorieModel?
    var categoryId:Int?
    var discountAmount:String?
    var discount = ["10","20","30","40","50"]
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesApi()
//        viewModel = SearchViewModel()
        let nib = UINib(nibName: "CategoryCell", bundle: nil)
        categoryTableView.register(nib, forCellReuseIdentifier: "cell")
        let nib2 = UINib(nibName: "DiscountCell", bundle: nil)
        discountTableView.register(nib2, forCellReuseIdentifier: "cell")
        dateView.isHidden = true
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.tintColor = .link
        datePicker.minimumDate = Date()
        
    }
    @objc func dateSelected() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: datePicker.date)
        dateLB.text = date
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
    @IBAction func discountButtonAction(_ sender: UIButton) {
        
        if discountTableView.isHidden == false
        {
            discountTableView.isHidden = true
        }
        else
        {
            discountTableView.isHidden = false
        }
        
    }
    @IBAction func searchButtonAction(_ sender: UIButton) {
        let vc =  self.storyboard?.instantiateViewController(identifier: "SearchFilterVC") as! SearchFilterVC
        
        vc.Controller = "Search"
        vc.category = categoryTF.text
        vc.Id = categoryId
        vc.discountAmount = discountAmount
        vc.expireDate = self.dateLB.text ?? "0"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
        dateLB.text = date
        dateView.isHidden = true
    }
    
    @IBAction func cancelDatePickerButtonAction(_ sender: UIButton) {
        dateView.isHidden = true
        dateLB.text = ""
    }
}
extension SearchVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == discountTableView
        {
            return discount.count
        }else
        {
            print((categoriesModel?.data?.cats?.count) ?? 0)
            return (categoriesModel?.data?.cats?.count) ?? 0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == discountTableView
        {
            
            let cell = discountTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DiscountCell
            cell.discountLbl.text = discount[indexPath.row]
            return cell
            
        }else
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
        else if tableView == discountTableView
        {
            let name = discount[indexPath.row]
            self.discountTF.text = name
            discountAmount = name
            discountTableView.isHidden = true
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
            self.discountTableView.reloadData()
        }
    }
}
