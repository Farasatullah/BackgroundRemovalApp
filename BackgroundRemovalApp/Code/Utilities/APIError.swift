//
//  APIError.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 18/12/2023.
//

import Foundation

enum APIError: String, Error {
    case jsonDecoding
    case response
    case noInternet
}
