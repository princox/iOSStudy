//
//  ViewController.swift
//  FoodTrackerStudy
//
//  Created by Minki on 2017. 9. 9..
//  Copyright © 2017년 Minki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var mealTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    let defaultText = "음식 이름"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        mealTextField.resignFirstResponder()
        mealTextField.text = ""

        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealLabel.text = mealTextField.text
    }

    @IBAction func setDefaultButton(_ sender: UIButton) {
        mealLabel.text = defaultText
    }
}

