//
//  LoginScreen.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 15/12/2023.
//
import SwiftUI
import GoogleSignIn
import Firebase
import FirebaseAuth

//struct LoginScreen: View {
//
//    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
//
//    @State var username:String = ""
//    @State var password:String = ""
//    @State private var isSecure: Bool = false
//
//    var body: some View {
//        VStack {
//            Text("Welcome Back")
//                .font(.largeTitle)
//                .fontWeight(.black)
//                .padding(.bottom,42)
//            VStack(spacing: 16.0) {
//                InputFieldView(data: $username,isSecure: false, title: "username")
//                InputFieldView(data: $password,isSecure: true,title: "Password")
//            }.padding(.bottom,16)
//
//            if viewModel.error == .noInternet {
//                Text("No internet".localized).modifier(ErrorLabel())
//            }
//            else if viewModel.error != nil {
//                Text("Login error".localized).modifier(ErrorLabel())
//
//            }
//
//            Button(
//                action: viewModel.login,
//                label: {
//                    Text("Login.LoginButton.Title".localized)
//                        .modifier(MainButton())
//                }
//            )
//            HStack {
//                Text("Forgotten Password?".localized)
//                    .underline()
//                    .modifier(ForgotButton())
//            }.padding(.top, 16)
//            HStack {
//                Text("OR".localized)
//                    .modifier(SignInOptionLabel())
//            }.padding(.top, 16)
//            Button
//            {
//                UserAuthModel.share.signinWithGoogle(presenting: getRootViewController()) { error in
//                    // TODO: Handle ERROR
//                }
//            } label: {
//                Image("G_SignIn")
//                    .applyImageProperties()
//            }
//            .modifier(GoogleSignInButton())
//            .padding(.top, 10)
//        }.padding(30)
//
//    }
//}

import SwiftUI


struct LoginScreen: View {
    @State var index = 0
    
    var body: some View {
        GeometryReader{_ in
            ScrollView {
                VStack {
                    Image("art")
                        .resizable()
//                        .frame(width: 100, height: 60, alignment: .center)
                    ZStack {
                            //Sign up
                        Signup(index: $index)
                            .zIndex(Double(self.index))
                            //Login View
                        Login(index: $index)
                    }
                    HStack(spacing: 15) {
                        Rectangle()
                            .fill(Color("Color1"))
                            .frame(height: 1)
                        
                        Text("OR")
                            .foregroundColor(.white)

                        
                        Rectangle()
                            .fill(Color("Color1"))
                            .frame(height: 1)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 50)
                    
                    //Social button
                    SocialButton() } .padding(.vertical)
            }
        }        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}




//MARK: - Social Button
struct SocialButton: View {
    
    var body: some View {
        HStack(spacing: 25) {
            
            //Apple
            Button(action: {
                
            }) {
                Image("apple")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 50, height: 50)
            }
            
            //Facebook
            Button(action: {
                
            }) {
                Image("G_SignIn")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 50, height: 50)
            }
            
            Button(action: {
                
            }) {
                Image("twitter")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 50, height: 50)
            }
        }
        .padding(.top, 30)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
