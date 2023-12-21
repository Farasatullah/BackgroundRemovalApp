//
//  SwiftUIView.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 10/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RootScreen()
            .environmentObject(Auth.shared)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
