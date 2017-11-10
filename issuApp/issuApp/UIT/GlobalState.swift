//
//  GlobaState.swift
//  issuApp
//
//  Created by 박수연 on 2017. 11. 3..
//  Copyright © 2017년 박수연. All rights reserved.
//

import Foundation

final class GlobalState{
    static let instance = GlobalState()
    
    enum Constants :String {
        case tokenKey
        case refreshTokenkey
    }
    
    var token: String? {
        get{
            let token = UserDefaults.standard.string(forKey: Constants.tokenKey.rawValue)
            return token
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.tokenKey.rawValue)
        }
    }
    
    var refreshToken: String? {
        get{
            let token = UserDefaults.standard.string(forKey: Constants.refreshTokenkey.rawValue)
            return token
        }
        set{
            UserDefaults.standard.set(newValue, forKey: Constants.refreshTokenkey.rawValue)
        }
    }
}
