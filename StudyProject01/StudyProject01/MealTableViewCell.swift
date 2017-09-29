//
//  MealTableViewCell.swift
//  StudyProject01
//
//  Created by INDAM94 on 2017. 9. 19..
//  Copyright © 2017년 ITeachers. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
