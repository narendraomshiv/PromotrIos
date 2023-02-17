//
//  NotificationCell.swift
//  Promotr
//
//  Created by Mac on 2/8/23.
//

import UIKit

class NotificationCell: UITableViewCell {

    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var timeAndDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setTableData(model:NotificationView)
    {
        self.titleLable.text = model.notificationTitle
        self.timeAndDate.text = model.notificationTime
    }
}
