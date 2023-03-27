//
//  CountryCell.swift
//  Promotr
//
//  Created by Mac on 3/1/23.
//

import UIKit

class CountryCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var countrycode: UILabel!
    @IBOutlet weak var emoji: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
