//
//  MemoCell.swift
//  DGMemory
//
//  Created by INDAM94 on 2017. 9. 29..
//  Copyright © 2017년 DGE. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     */
    
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var regdate: UILabel!
    @IBOutlet var img: UIImageView!
    
}
