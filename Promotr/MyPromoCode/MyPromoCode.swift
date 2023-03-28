//
//  MyPromoCode.swift
//  Promotr
//
//  Created by Mac on 2/13/23.
//

import UIKit
//import Charts
class MyPromoCode: UIViewController {
    
//    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var addNewButton: UIButton!
    @IBOutlet weak var numberOfUserUserIT: UILabel!
    @IBOutlet weak var onGoingTableView: UITableView!
    @IBOutlet weak var myBestPromoCode: UILabel!
    @IBOutlet weak var categoryTableView:UITableView!
    @IBOutlet weak var promoView:UIView!
    var viewModel:OngoingView?
    override func viewDidLoad() {
        super.viewDidLoad()
        promoView.layer.cornerRadius = 25
        promoView.layer.borderWidth = 1.5
        promoView.layer.borderColor = #colorLiteral(red: 0, green: 0.6274509804, blue: 0.7137254902, alpha: 1)
        addNewButton.layer.cornerRadius = 25
        let nib = UINib(nibName: "OnGoingCell", bundle: nil)
        onGoingTableView.register(nib, forCellReuseIdentifier: "cell")
        promoList()
    }
    
    @IBAction func historyButtonAction(_ sender: UIButton) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryPage") as! HistoryPage
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    @IBAction func addNewButtonAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "AddPromocodeVC") as! AddPromocodeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
extension MyPromoCode:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  (viewModel?.data?.promocode?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = onGoingTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OnGoingCell
        cell.discountLbl.text = viewModel?.data?.promocode?[indexPath.row].description
        cell.companyName.text = viewModel?.data?.promocode?[indexPath.row].store_name
        cell.codeLable.text = viewModel?.data?.promocode?[indexPath.row].code_id
        return cell
    }
    
    func promoList()
    {
        let param = [String:Any]()
        OnGoingViewModel.getPromoCode(viewController: self, parameters:param as NSDictionary ) {
            responseObject in
            self.viewModel = responseObject
            print("Get Data SuccessFully")
            self.onGoingTableView.reloadData()
        }
    }
}
