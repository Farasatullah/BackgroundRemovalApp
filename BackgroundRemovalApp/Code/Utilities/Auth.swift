//
//  Auth.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 17/12/2023.
//

import Foundation
import SwiftKeychainWrapper

class Auth: ObservableObject {
    
    static let shared: Auth = Auth()
    private let keychain: KeychainWrapper = KeychainWrapper.standard
    
    @Published var loggedIn: Bool = false
    
    private init() {
        loggedIn = hasAccessToken()
    }
    
    func getCredentials() -> Credentials {
        return Credentials(
            accessToken: keychain.string(forKey: KeychainKey.accessToken.rawValue),
            refreshToken: keychain.string(forKey: KeychainKey.refreshToken.rawValue)
        )
    }
    func getUserCredentials() -> UserCredentials {
        return UserCredentials(
            name: keychain.string(forKey: KeychainUserKey.name.rawValue),
            email: keychain.string(forKey: KeychainUserKey.email.rawValue),
            imageUrl: keychain.string(forKey: KeychainUserKey.imageUrl.rawValue)
        )
    }
    func setCredentials(accessToken: String, refreshToken: String) {
        keychain.set(accessToken, forKey: KeychainKey.accessToken.rawValue)
        keychain.set(refreshToken, forKey: KeychainKey.refreshToken.rawValue)
        loggedIn = true
    }
    func setUserCredentials(name: String, email: String,imageUrl:String) {
        keychain.set(name, forKey: KeychainUserKey.name.rawValue)
        keychain.set(email, forKey: KeychainUserKey.email.rawValue)
        keychain.set(imageUrl, forKey: KeychainUserKey.imageUrl.rawValue)
        loggedIn = true
    }
    func hasAccessToken() -> Bool {
        return getCredentials().accessToken != nil
    }
    
    func getAccessToken() -> String? {
        return getCredentials().accessToken
    }

    func getRefreshToken() -> String? {
        return getCredentials().refreshToken
    }

    func logout() {
        KeychainWrapper.standard.removeObject(forKey: KeychainKey.accessToken.rawValue)
        KeychainWrapper.standard.removeObject(forKey: KeychainKey.refreshToken.rawValue)
        KeychainWrapper.standard.removeObject(forKey: KeychainUserKey.name.rawValue)
        KeychainWrapper.standard.removeObject(forKey: KeychainUserKey.email.rawValue)
        KeychainWrapper.standard.removeObject(forKey: KeychainUserKey.imageUrl.rawValue)

        loggedIn = false
    }
    
}
