//
//  APIRoute+Login.swift
//  AdvancedAlamofire
//
//  Created by Grzegorz Przybyła on 03/03/2019.
//  Copyright © 2019 Grzegorz Przybyła. All rights reserved.
//

import Foundation
import Alamofire

struct APIRoute {}
extension APIRoute {
    struct Login: APIRouteable {
        let name: String
        let password: String
        
        let path: String = "user"
        let method: HTTPMethod = .post
        var parameters: Parameters? {
            return ["username": name,
                    "password": password
            ]
        }
        let encoding: ParameterEncoding = JSONEncoding.default
    }
}
