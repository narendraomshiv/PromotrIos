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
    @IBOutlet weak var promoView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        promoView.layer.cornerRadius = 25
        promoView.layer.borderWidth = 1.5
        promoView.layer.borderColor = #colorLiteral(red: 0, green: 0.6274509804, blue: 0.7137254902, alpha: 1)
        addNewButton.layer.cornerRadius = 25
        let nib = UINib(nibName: "OnGoingCell", bundle: nil)
        onGoingTableView.register(nib, forCellReuseIdentifier: "cell")
        let months = ["", ""]
        let unitsSold = [60.0, 40.0]
//        setChart(dataPoints: months, values: unitsSold)
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
    
    // pieChartView
//    func setChart(dataPoints: [String], values: [Double]) {
//        var dataEntries: [ChartDataEntry] = []
//        let dataEntry1 = ChartDataEntry(x: Double(0.0), y: 60.0)
//        let dataEntry2 = ChartDataEntry(x: Double(0.0), y: 40.0)
//        let dataEntry3 = ChartDataEntry(x: Double(0.0), y: 20.0)
//        let dataEntry4 = ChartDataEntry(x: Double(0.0), y: 10.0)
//        dataEntries.append(dataEntry1)
//        dataEntries.append(dataEntry2)
//        dataEntries.append(dataEntry3)
//        dataEntries.append(dataEntry4)
//        print(dataEntries[0].data as Any)
//        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
//        let pieChartData = PieChartData(dataSet: pieChartDataSet)
//        pieChart.data = pieChartData
//        
//        let colors: [UIColor] = [UIColor(cgColor:#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)), UIColor(cgColor:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)),UIColor(cgColor:#colorLiteral(red: 0, green: 0.6274509804, blue: 0.7137254902, alpha: 1)),UIColor(cgColor:#colorLiteral(red: 0.5294117647, green: 0.1960784314, blue: 0, alpha: 1))]
//        pieChartDataSet.colors = colors
//    }
}
extension MyPromoCode:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = onGoingTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OnGoingCell
        return cell
    }
    
    
}
