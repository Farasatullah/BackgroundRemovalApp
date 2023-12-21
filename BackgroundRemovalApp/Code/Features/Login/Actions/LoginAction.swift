//
//  LoginAction.swift
//  BackgroundRemovalApp
//
//  Created by Farasat_Niazi on 15/12/2023.
//
import Foundation

import Foundation

struct LoginAction {
    let path = "/login"
    let method: HTTPMethod = .post
    var parameters: LoginRequest
    var authorized: Bool = true
    
    func call(
        completion: @escaping (LoginResponse) -> Void,
        failure: @escaping (APIError) -> Void
    ) {
        APIRequest<LoginRequest, LoginResponse>.call(
            path: path,
            method: .post,
            authorized: authorized, parameters: parameters
        ) { data in
            if let response = try? JSONDecoder().decode(
                LoginResponse.self,
                from: data
            ) {
                completion(response)
            } else {
                failure(.jsonDecoding)
            }
        } failure: { error in
            failure(error)
        }
    }
}
