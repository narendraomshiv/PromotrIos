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
    var ViewModel:FavoriteViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewModel = FavoriteViewModel()
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self
        myTableView.delegate = self
    }

}
extension FavoritesVC:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (ViewModel?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! FavoriteTableViewCell
        cell.setUpdataFromModel(model: (ViewModel?.items[indexPath.row])!)
        return cell
    }
    
    
}
