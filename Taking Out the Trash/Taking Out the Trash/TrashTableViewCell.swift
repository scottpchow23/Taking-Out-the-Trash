//
//  TrashTableViewCell.swift
//  Taking Out the Trash
//
//  Created by Scott Chow on 6/29/16.
//  Copyright © 2016 Scott Chow. All rights reserved.
//

import UIKit

class TrashTableViewCell: UITableViewCell {
    @IBOutlet weak var recycleLabel: UILabel!
    @IBOutlet weak var compostLabel: UILabel!
    @IBOutlet weak var garbageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
