//
//  LoginResponse.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 15/12/2023.
//

import Foundation

struct LoginResponse: Decodable {
    let data: LoginResponseData
}

struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}
