//
//  Login.swift
//  LoginApp
//
//  Created by Farasat_Niazi on 20/12/2023.
//

import Foundation
import SwiftUI

//MARK: - Login
struct Login: View {
    
    @State var email = ""
    @State var pass = ""
    @Binding var index: Int
    //    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    //
    //    @State var username:String = ""
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 30)
                
                    //Email Field
                VStack {
                    HStack {
//                        Image(systemName: "envelope.fill")
//                            .foregroundColor(Color("Color1"))
                        
//                        TextField("Email Address", text: self.$email)
                        InputFieldView(data: $email,isSecure: false, title: "Username")
                    }
                    
//                    Divider().background(Color.white.opacity(0.5))
                }
//                .padding(.horizontal)
                .padding(.top, 40)
                
                    //Password Field
                VStack {
                    HStack {
//                        Image(systemName: "eye.slash.fill")
//                            .foregroundColor(Color("Color1"))
//                        
//                        SecureField ("Password", text: self.$email)
                        InputFieldView(data: $pass,isSecure: true, title: "Password")

                    }
                    
//                    Divider().background(Color.white.opacity(0.5))
                }
//                .padding(.horizontal)
                .padding(.top, 30)
                
                    //Forget Password
                HStack {
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }) {
                        Text("Forget Passward?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShapeRight())
            .contentShape(CShapeRight())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
                //Login Butto
            Button(action: {
                
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
     
    
}

