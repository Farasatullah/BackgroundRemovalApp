//
//  UserAuthModel.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 19/12/2023.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import Firebase
struct UserAuthModel {
    static let share = UserAuthModel()
    
    private init() {}
    
    func signinWithGoogle(presenting: UIViewController, completion: @escaping (Error?) -> Void) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: presenting) { result, error in
            if let error = error {
                completion(error)
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                let signInError = NSError(domain: "SignInErrorDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to retrieve user information."])
                completion(signInError)
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            FirebaseAuth.Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else {
                    completion(error)
                    return
                }

                print("SIGN IN")
                UserDefaults.standard.set(true, forKey: "signIn")
                
                // Fetch additional user information from Google
                let googleProfile = GIDSignIn.sharedInstance.currentUser?.profile
                let userProfileImageURL = googleProfile?.imageURL(withDimension: 100)?.absoluteString
                let userName = googleProfile?.name
                let userEmail = googleProfile?.email

                // You can fetch more information here as needed
                
                // Handle the fetched user information accordingly
                print("User Profile Image URL: \(userProfileImageURL ?? "N/A")")
                print("User Name: \(userName ?? "N/A")")
                print("User Email: \(userEmail ?? "N/A")")
                Auth.shared.setUserCredentials(name: userName ?? "N/A", email: userEmail ?? "N/A", imageUrl: userProfileImageURL ?? "N/A")
                
            
                // Call completion after successful sign-in and data fetch
                completion(nil)
            }
        }
    }
}

//struct UserAuthModel {
//    static let share = UserAuthModel()
//
//    private init() {}
//
//    func signinWithGoogle(presenting: UIViewController,
//                          completion: @escaping (Error?) -> Void) {
//
//    guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//
//    // Create Google Sign In configuration object.
//    let config = GIDConfiguration(clientID: clientID)
//    GIDSignIn.sharedInstance.configuration = config
//
//    GIDSignIn.sharedInstance.signIn(
//        withPresenting: presenting) {
//        result, error in
//      if let error = error {
//        return
//
//      }
//        guard
//            let user = result?.user,
//            let idToken = user.idToken?.tokenString
//      else {
//            return
//        }
//
//      let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                     accessToken: user.accessToken.tokenString)
//
//            FirebaseAuth.Auth.auth().signIn(with: credential){
//                result,error in
//                guard error == nil else {
//
//                    return
//                }
//                print("SIGN IN")
//                UserDefaults.standard.set(true, forKey: "signIn")
//            }
//
//        }
//
//    }
//
//}
