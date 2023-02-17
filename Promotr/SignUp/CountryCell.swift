//
//  CountryCell.swift
//  Promotr
//
//  Created by Mac on 2/15/23.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setDataInTableView(Model:signUpView)
    {
        countryName.text = Model.countryName
    }
}
