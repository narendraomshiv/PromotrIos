//
//  HistoryTable.swift
//  Promotr
//
//  Created by Mac on 2/13/23.
//

import UIKit

class HistoryTable: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var codeLable: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var companyImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.borderWidth = 0.5
        cellView.layer.masksToBounds = true
        cellView.layer.borderColor = UIColor.systemGray2.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpDataInTableView(model:HistoryPageView)
    {
        companyName.text = model.companyName
        codeLable.text = model.promoCode
        discountLbl.text = model.discount
    }
}
