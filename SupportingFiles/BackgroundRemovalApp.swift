//
//  BackgroundRemovalApp.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 12/12/2023.
//

import Foundation
import SwiftUI
import FirebaseCore

@main
struct BackgroundRemovalAPP: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
            NetworkMonitor.shared.startMonitoring() // Check network
        }

    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
     
    }
}
