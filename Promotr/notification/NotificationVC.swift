//
//  NotificationVC.swift
//  Promotr
//
//  Created by Mac on 2/8/23.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet weak var myTableView:UITableView!
    
    var viewModel:NotificationViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NotificationViewModel()
        let nib = UINib(nibName: "NotificationCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "cell")
      
    }
}
extension NotificationVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! NotificationCell
        cell.setTableData(model: (viewModel?.items[indexPath.row])!)
       
        return cell
    }
    
    
}
