//
//  HistoryPage.swift
//  Promotr
//
//  Created by Mac on 2/13/23.
//

import UIKit

class HistoryPage: UIViewController {

    @IBOutlet weak var historyTable: UITableView!
    var dataModel:HistoryPageViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
    dataModel = HistoryPageViewModel()
        let nib = UINib(nibName: "HistoryTable", bundle: nil)
        historyTable.register(nib, forCellReuseIdentifier: "cell")
    }
    

    @IBAction func backButtonAction(_ sender: UIButton) {
        view.removeFromSuperview()
    }
    

}
extension HistoryPage:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataModel?.data.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTable
        cell.setUpDataInTableView(model:(dataModel?.data[indexPath.row])!)
        return cell
    }
    
    
}
