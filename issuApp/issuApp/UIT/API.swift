//
//  API.swift
//  issuApp
//
//  Created by 박수연 on 2017. 11. 3..
//  Copyright © 2017년 박수연. All rights reserved.
//

import Foundation
import OAuthSwift

protocol API {
    func getToken(handler: @escaping(() -> Void))
    func tokenRefresh(handler: @escaping(() -> Void))
}
    
    struct GitHubAPI: API {
        let oauth = OAuth2Swift(consumerKey: "1b8bd0200d212c541518", consumerSecret: "33fd629008731c21fbef83e8195418bc0b16639e", authorizeUrl: "https://github.com/login/oauth/authorize",
                                accessTokenUrl: "https://github.com/login/oauth/access_token",
                                responseType: "code")
        
        
        func getToken(handler: @escaping (() -> Void)) {
            oauth.authorize(withCallbackURL: "issuapp://oauth-callback/github", scope: "user,repo", state: "state", success: { (credential, _, _) in
                let token = credential.oauthToken
                print("token: \(token)")
            }, failure: {error in print(error)})
        }
        func tokenRefresh(handler: @escaping (() -> Void)) {
            guard let refreshToken = GlobalState.instance.refreshToken else{
                return
            }
            oauth.renewAccessToken(withRefreshToken: refreshToken, success: { (credential, _, _) in
                let token = credential.oauthToken
                let refreshToken = credential.oauthRefreshToken
                print("token: \(token)")
                GlobalState.instance.token = token
                GlobalState.instance.refreshToken = refreshToken
                handler()
            }, failure: {error in
                print(error)
            })
        }
    
    }
    

