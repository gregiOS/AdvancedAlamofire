//
//  APIRoute.swift
//  AdvancedAlamofire
//
//  Created by Grzegorz Przybyła on 03/03/2019.
//  Copyright © 2019 Grzegorz Przybyła. All rights reserved.
//

import Foundation
import Alamofire

enum APIRoute: URLRequestConvertible {
    case login(name: String, password: String)
    // MARK: - API Request info
    var baseURL: String { return URLs.baseURL }
    var path: String {
        switch self {
        case .login:
            return "/users"
        }
    }
    var parameters: Parameters? {
        switch self {
        case .login(let args):
            return ["username": args.name,
                    "password": args.password
            ]
        }
    }
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    var encoding: ParameterEncoding {
        switch self {
        case .login:
            return JSONEncoding.default
        }
    }
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        // Alamofires String extension
        let url = try baseURL.asURL().appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
