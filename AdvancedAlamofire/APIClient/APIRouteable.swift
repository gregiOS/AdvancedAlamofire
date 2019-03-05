//
//  APIRoutable.swift
//  AdvancedAlamofire
//
//  Created by Grzegorz Przybyła on 03/03/2019.
//  Copyright © 2019 Grzegorz Przybyła. All rights reserved.
//

import Foundation
import Alamofire

protocol APIRouteable: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension APIRouteable {
    var baseURL: String { return URLs.baseURL }
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
