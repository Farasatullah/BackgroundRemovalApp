//
//  HomeViewModel.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 17/12/2023.
//

import Foundation

class HomeViewModel: ObservableObject {

    func logout() {
        Auth.shared.logout()
    }
}
