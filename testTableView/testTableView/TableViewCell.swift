//
//  tableViewCell.swift
//  testTableView
//
//  Created by JeongHoonRhee on 2017. 9. 3..
//  Copyright © 2017년 princox. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    weak var cellDelegate: MyCellDelegate?
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(self.tag)
    }
    
}
