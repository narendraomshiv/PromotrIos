//
//  FavoritesCell.swift
//  Promotr
//
//  Created by Mac on 2/7/23.
//

import UIKit

class FavoritesCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var codeLable: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var companyLalbe: UIImageView!
    
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

}
