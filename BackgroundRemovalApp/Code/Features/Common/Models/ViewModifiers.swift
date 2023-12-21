//
//  ViewModifiers.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 18/12/2023.
//

import SwiftUI

struct MainButton: ViewModifier {
    var color: Color = Color.blue
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .heavy, design: .default))
            .font(.title3)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
    }
}
struct ErrorLabel: ViewModifier {
    var color: Color = Color.red
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold, design: .default))
            .foregroundColor(.red)
    }
}
struct ForgotButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .thin, design: .default))
            .foregroundColor(Color.white)
    }
}
struct SignInOptionLabel: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .thin, design: .default))
            .foregroundColor(Color.white)
    }
}
struct GoogleSignInButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 30, height: 30)
            .overlay(Circle().stroke(Color.white, lineWidth: 0))
    }
}
struct SignInTextField: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .frame(height: 42)
            .overlay(
              RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                  .stroke(Color.gray, lineWidth: 1)
            )
        
    }
}
struct TextOverlay: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .thin, design: .default))
            .foregroundColor(Color.white)
            .multilineTextAlignment(.leading)
            .padding(4)
            .background(Color("Color2"))
    }
}
extension Image {
    func applyImageProperties() -> some View {
        self
            .resizable() // Set the image as resizable
            .aspectRatio(contentMode: .fill)
            .frame(width: 30, height: 30)
            .clipShape(Circle())
    }
}
