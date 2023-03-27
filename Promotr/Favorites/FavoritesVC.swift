//
//  FavoritesVC.swift
//  Promotr
//
//  Created by Mac on 2/7/23.
//

import UIKit

class FavoritesVC: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
// access View model
    var ViewModel:FavoriteModel?
    override func viewDidLoad() {
        super.viewDidLoad()
//        FavoriteApis()
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if (UserDefaults.standard.string(forKey: "userid") != nil)
        {
            FavoriteApis()
        }
        else
        {
            CommonMethods.showAlertMessage(title:Constant.TITLE, message:Constant.PLS_LOGIN, view: self)
        }
        
        
        
    }
}
extension FavoritesVC:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (ViewModel?.data?.favoritePromoCode?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! FavoriteTableViewCell
        cell.codeLable.text = ViewModel?.data?.favoritePromoCode?[indexPath.row].code_id
        cell.discountLbl.text = ViewModel?.data?.favoritePromoCode?[indexPath.row].description
        cell.companyName.text = ViewModel?.data?.favoritePromoCode?[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = self.storyboard?.instantiateViewController(identifier: "SearchFilterVC") as! SearchFilterVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    func FavoriteApis()
    {
        let param = [String:Any]()
        FavoriteViewModel.favoriteApi(viewController: self, parameters:param as NSDictionary ) {
            responseObject in
            self.ViewModel = responseObject
            print("Get Data SuccessFully")
            self.myTableView.reloadData()
        }
    }
}
