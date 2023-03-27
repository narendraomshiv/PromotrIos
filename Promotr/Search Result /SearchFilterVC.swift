//
//  SearchFilterVC.swift
//  Promotr
//
//  Created by Mac on 3/10/23.
//

import UIKit

class SearchFilterVC: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    var Id:Int?
    var discountAmount:String?
    var expireDate = "0"
    var searchModel:SearchFilterView?
    var searchByPromoocde:PromocodeDataModel?
    var Controller:String?
    @IBOutlet weak var CategoryName: UILabel!
    @IBOutlet weak var searchTopView:UIView!
    @IBOutlet weak var filterview1:UIView!
    @IBOutlet weak var filterview2:UIView!
    @IBOutlet weak var filterview3:UIView!
    @IBOutlet weak var filterview4:UIView!
    @IBOutlet weak var searchView:UIView!
    @IBOutlet weak var filter1Label: UILabel!
    @IBOutlet weak var filterLabel4: UILabel!
    @IBOutlet weak var filterLabel3: UILabel!
    @IBOutlet weak var filterLabel2: UILabel!
    @IBOutlet weak var crossBtn1: UIButton!
    @IBOutlet weak var crossBtn4: UIButton!
    @IBOutlet weak var crossBtn3: UIButton!
    @IBOutlet weak var crossBtn2: UIButton!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    var category:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryName.text = category
      print(category)
        print(expireDate)
        print(discountAmount)
        Filter()
        searchTopView.layer.cornerRadius = 25
        self.searchTopView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        if Controller == "Search"
        {
            promoCodeBySearchFilter()
            topViewHeightConstraint.constant = 210
            searchView.isHidden = false
        }
        else
        {
            topViewHeightConstraint.constant = 50
//            filterview1.isHidden = true
//            filterview2.isHidden = true
            categoryDetails()
            searchView.isHidden = true
        }
    }
    
    func Filter()
    {
        if expireDate == ""
        {
          expireDate = "0"
            filterview2.isHidden = true
        }
       if category == ""
        {
            Id = 0
            filterview1.isHidden = true
        }
        if discountAmount == nil
        {
            discountAmount = "0"
            filterview3.isHidden = true
        }
        else
        {
            filter1Label.text = category
            filterLabel2.text = expireDate
            filterLabel3.text = discountAmount
        }
    }
    @IBAction func crossBtnAction(_ sender : UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func removeFilterButton(_sender : UIButton)
    {
        let tag = _sender.tag
        print(tag)
        if tag == 1
        {
            category = "0"
            filterview1.isHidden = true
            print("new")
            promoCodeBySearchFilter()
        }
        if tag == 2
        {
            expireDate = "0"
            filterview2.isHidden = true
            print("expireDate")
            promoCodeBySearchFilter()
        }
        if tag == 3
        {
            discountAmount = "0"
            filterview3.isHidden = true
            print("discountAmount")
            promoCodeBySearchFilter()
        }
        if tag == 4
        {
           
            filterview4.isHidden = true
            print("dont'know")
        }
    }
}
extension SearchFilterVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Controller == "Search" {
            return (searchByPromoocde?.Data?.promoDetails?.count) ?? 0
        }
        else
        {
            return (searchModel?.data?.category?.promocodesDetails?.count) ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchResultCell
        if Controller == "Search"
        {
            cell.discountLbl.text = searchByPromoocde?.Data?.promoDetails?[indexPath.row].description
            cell.codeLable.text = searchByPromoocde?.Data?.promoDetails?[indexPath.row].code_id
            cell.companyName.text = searchByPromoocde?.Data?.promoDetails?[indexPath.row].title
        }
        else
        {
            
            cell.discountLbl.text = searchModel?.data?.category?.promocodesDetails?[indexPath.row].description
            cell.codeLable.text = searchModel?.data?.category?.promocodesDetails?[indexPath.row].code_id
            cell.companyName.text = searchModel?.data?.category?.promocodesDetails?[indexPath.row].title
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Controller == "Search"
        {
            let id = searchByPromoocde?.Data?.promoDetails?[indexPath.row].id
        let vc = self.storyboard?.instantiateViewController(identifier: "PromoCode") as! PromoCode
        vc.id = id
        self.navigationController?.pushViewController(vc, animated: true)
        }
        
     else
        {
            let id = searchModel?.data?.category?.promocodesDetails?[indexPath.row].id
        let vc = self.storyboard?.instantiateViewController(identifier: "PromoCode") as! PromoCode
        vc.id = id
        self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    func categoryDetails(){
        var param = [String:Any]()
        param = ["id":Id ?? 0]
        SearchFilterViewModel.callApiFromCategoryPromoCode(viewController: self, parameters:param as NSDictionary ) {
            responseObject in
            self.searchModel = responseObject
            print("Get Data SuccessFully")
            self.tableView.reloadData()
        }
    }
    
    func promoCodeBySearchFilter(){
        var paramDict = [String:Any]()
        paramDict = ["category_id":Id ?? 0,"discount_amount":discountAmount ?? "0","expiry_date":expireDate]
        print(paramDict)
        SearchFilterViewModel.callApiFromPromoCode(viewController: self, parameters:paramDict as NSDictionary ) {
            responseObject in
            self.searchByPromoocde = responseObject
            print("Get Data SuccessFully")
            self.tableView.reloadData()
        }
    }
    
}

