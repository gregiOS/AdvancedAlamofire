//
//  APIRoute+GetBooks.swift
//  AdvancedAlamofire
//
//  Created by Grzegorz Przybyła on 03/03/2019.
//  Copyright © 2019 Grzegorz Przybyła. All rights reserved.
//

import Alamofire
extension APIRoute {
    struct GetBooks: APIRouteable {
        var path: String
        var method: HTTPMethod
        var parameters: Parameters?
        var encoding: ParameterEncoding
    }
}
