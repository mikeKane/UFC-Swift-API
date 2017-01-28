//
//  Cell.swift
//  UFC Pocket Companion
//
//  Created by Michael Kane on 1/28/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    
    @IBOutlet var fighterImage: UIImageView!
    @IBOutlet var fighterName: UILabel!
    @IBOutlet var nickName: UILabel!
    @IBOutlet var winsLabel: UILabel!
    @IBOutlet var lossLabel: UILabel!
    @IBOutlet var winValueLabel: UILabel!
    @IBOutlet var lossValueLabel: UILabel!
    @IBOutlet var wightClassLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
