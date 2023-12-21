//
//  RootScreen.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 18/12/2023.
//

import SwiftUI

struct RootScreen: View {
    
    @EnvironmentObject var auth: Auth
    @AppStorage("signIn") var isSignIn = false

    var body: some View {
        if auth.loggedIn {
            HomeScreen()
        } else {
            LoginScreen().preferredColorScheme(.dark)
        }
//        if !isSignIn {
//                       LoginScreen()
//                   } else {
//                       HomeScreen()
//                   }
    }
}

struct RootScreen_Previews: PreviewProvider {
    static var previews: some View {
        RootScreen()
    }
}
