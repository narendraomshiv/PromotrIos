//
//  SearchResultCell.swift
//  Promotr
//
//  Created by Mac on 3/10/23.
//

import UIKit

class SearchResultCell: UITableViewCell {
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var codeLable: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var CompanyLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
