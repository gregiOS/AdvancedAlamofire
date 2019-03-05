//
//  APIClient.swift
//  AdvancedAlamofire
//
//  Created by Grzegorz Przybyła on 03/03/2019.
//  Copyright © 2019 Grzegorz Przybyła. All rights reserved.
//

import UIKit
import Alamofire

class APIClient {
    // MARK: - Properties
    let session: Session
    init(session: Alamofire.Session = .default) {
        self.session = session
    }
    // MARK: - Perform request
    func perform<T: Decodable>(_ apiRoute: APIRouteable,
                 completion: @escaping (Result<T>) -> Void) {
        let dataRequest = session
            .request(apiRoute)
        dataRequest
            .validate(statusCode: 200..<300)
            .responseDecodable(completionHandler: {  [weak dataRequest] (response: DataResponse<T>) in
                dataRequest.map { debugPrint($0) }
                let responseData = response.data ?? Data()
                let string = String(data: responseData, encoding: .utf8)
                print("Repsonse string: \(string ?? "")")
                switch response.result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }
    
    func loginUser(named: String, password: String, completion: @escaping (Result<OAuth2Token>) -> Void) {
        let loginRoute = APIRoute.Login(name: named, password: password)
        perform(loginRoute, completion: completion)
    }
}


struct OAuth2Token: Decodable {}
