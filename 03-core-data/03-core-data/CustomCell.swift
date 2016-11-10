//
//  CustomCell.swift
//  03-core-data
//
//  Created by Admin on 09/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
