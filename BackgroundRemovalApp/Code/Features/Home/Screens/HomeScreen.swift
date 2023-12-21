//
//  HomeScreen.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 17/12/2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        Color(red: 21.0/255.0, green: 90.0/255.0, blue: 120.0/255.0)
            .edgesIgnoringSafeArea(.all)
            .overlay(
        NavigationView {
            VStack{
                
                ProfileImage(imageName: "unsplash")
                    .padding()
                
                Form {
                    Section(header: Text("Personal Info")) {
                        Label(UserCredentials().name ?? "N/A", systemImage: "person.fill")
                        Label(UserCredentials().email ?? "N/A", systemImage: "envelope.circle.fill")
                    }
                }
            }.navigationTitle("Profile")
            }
            
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading){
                        Button("About") {
                            print("About tapped!")
                        }
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing){   Button("Help") {
                            print("Help tapped!")
                        }
                    }
                }
                .accentColor(.red)
                )

        
            
//        VStack {
//
//
//
//            //            Ui
////            Rectangle()
////                .size(width: 50, height: 50)
//
//            Text("Home.Title".localized)
//                .font(.system(size: 24, weight: .bold, design: .default))
//
//            Spacer()
//
//            Button(
//                action: viewModel.logout,
//                label: {
//                    Text("Home.LogoutButton.Title".localized)
//                        .modifier(MainButton(color: Color.red))
//                }
//            ).padding(30)
//        }
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
struct ProfileImage: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100,height: 100)
            .clipShape(Circle())
    }
}
