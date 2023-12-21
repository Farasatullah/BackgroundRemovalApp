//
//  InputFieldView.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 18/12/2023.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var data: String
    var isSecure: Bool? = false
    var title: String? = "Username"

    var body: some View {
      ZStack {
          if let secure = isSecure, secure {
              ZStack(alignment: .leading){
                  
                  SecureField("", text: $data).modifier(SignInTextField())
                  HStack {
                      Image(systemName: "eye.slash.fill")
                          .padding(.leading, 8)
                          .padding(.top, 8)

                          .foregroundColor(Color("Color1"))
                          .offset(x: 0, y: 0) // Adjust the offset if needed
                      Spacer()
                  }
              }
          } else {
              ZStack(alignment: .leading){

                  TextField("", text: $data).modifier(SignInTextField())
                  HStack {
                      Image(systemName: "envelope.fill")
                          .padding(.leading, 8)
                          .padding(.top, 8)

                          .foregroundColor(Color("Color1"))
                          .offset(x: 0, y: 0) // Adjust the offset if needed
                      Spacer()
                  }
              }
//              .padding()
              

          }
        HStack {
            Text(title ?? "Input")
                .modifier(TextOverlay())

            Spacer() // pushing the text to the left
        }
        .padding(.leading, 8)
        .offset(CGSize(width: 0, height: -20))  // pushign the text up to overlay the border of the input field
      }.padding(4)
    }
}

struct InputFieldView_Previews: PreviewProvider {
    
    @State static var data:String = ""
    static var previews: some View {
        InputFieldView(data: $data,isSecure: false, title: "Username")
    }
}
