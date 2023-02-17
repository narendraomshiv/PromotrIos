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
    
    @IBOutlet weak var dateLB: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    var viewModel:SearchViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel()
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
        datePicker.maximumDate = Date()
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
        if tableView == categoryTableView
        {
            return (viewModel?.CategoryJSON.count)!
        }else
        {
            return (viewModel?.discountJSON.count)!
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        if tableView == categoryTableView
        {
            let cell = categoryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryCell
            cell.setDataFromCell(model: (viewModel?.category[indexPath.row])!)
            return cell
            
        }else
        {
            let cell = discountTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DiscountCell
            cell.setDataFromCells(model:(viewModel?.discount[indexPath.row])!)
            return cell
        }
    }
    
    
}
