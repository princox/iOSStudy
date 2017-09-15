//
//  File.swift
//  StudyProject01
//
//  Created by INDAM94 on 2017. 9. 13..
//  Copyright © 2017년 ITeachers. All rights reserved.
//

import UIKit

class Meal {
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        if name.isEmpty || rating < 0  {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
