//
//  PromotrGetByIDCell.swift
//  Promotr
//
//  Created by Mac on 3/29/23.
//

import UIKit

class PromotrGetByIDCell: UITableViewCell {

    @IBOutlet weak var promoTitles: UILabel!
    @IBOutlet weak var copyBtn: UIButton!
    @IBOutlet weak var promoCode: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func copyButtonAction(_ sender: UIButton) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
