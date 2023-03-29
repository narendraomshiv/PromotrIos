//
//  PermotrGetByID.swift
//  Promotr
//
//  Created by Mac on 3/29/23.
//

import UIKit

class PermotrGetByID: UIViewController {

    @IBOutlet weak var promotrProfile: UIImageView!
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var fevButton: UIButton!
    @IBOutlet weak var detailsTableView: UITableView!
    var id:Int?
    var viewModel:PromotrGetByModel?
    var saveFevModel:userPromotrFev?
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
        ProfileImageView.layer.cornerRadius = 30
               self.ProfileImageView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
    }
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        if fevButton.isSelected == false
        {
            fevButton.isSelected = true
            fevButton.setImage(UIImage(named: "fav_selected"), for: .normal)
//            saveFevPromotr()
        }
        else
        {
            fevButton.isSelected = false
            fevButton.setImage(UIImage(systemName:"star"), for: .normal)
        }
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension PermotrGetByID:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PromotrGetByIDCell
        return cell
    }
    func callApi()
    {
        var param = [String:Any]()
        param = ["id":44]
        print(param)
        PromotrGetByViewModel.callGetProterbyIdApi(viewController: self, parameters: param as NSDictionary) { (responseObject) in
            self.viewModel = responseObject
            self.detailsTableView.reloadData()
            print("data get success")
        }
    }
    func saveFevPromotr()
    {
        let param = ["promoter_id":49]
        print(param)
        PromotrGetByViewModel.userFevPromotr(viewController: self, parameters: param as NSDictionary) { (responseObject) in
            self.saveFevModel = responseObject
            print("successFully")
        }
    }
}

