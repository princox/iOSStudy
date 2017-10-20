//
//  ViewController.swift
//  BabyDiary
//
//  Created by INDAM94 on 2017. 9. 19..
//  Copyright © 2017년 DGE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    @IBOutlet var FoodBtn: UIButton!
    
    @IBAction func SelectFood(_ sender: Any) {
        let alert_SENDTYPE = UIAlertController(title: "", message: "방식", preferredStyle: .actionSheet)
        
        let confilm_SMS = UIAlertAction(title: "분유", style: .default){
            (_) in
            self.FoodBtn.setTitle("분유", for: .normal)
        }
        let confilm_ONLY = UIAlertAction(title: "분유", style: .default){
            (_) in
            self.FoodBtn.setTitle("분유", for: .normal)
        }
        alert_SENDTYPE.addAction(confilm_SMS)
        alert_SENDTYPE.addAction(confilm_ONLY)
        self.present(alert_SENDTYPE, animated: false)
    }
    

}

