//
//  LoginViewController.swift
//  issuApp
//
//  Created by 박수연 on 2017. 11. 3..
//  Copyright © 2017년 박수연. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {
    
    //누르면 로그인이 된다
    @IBAction func Logintogit(_ sender: Any) {
        App.api.getToken {
            
        }
    }
    
    
    


}
