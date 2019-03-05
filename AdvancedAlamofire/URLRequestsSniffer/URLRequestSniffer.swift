//
//  URLRequestSniffer.swift
//  AdvancedAlamofire
//
//  Created by Grzegorz Przybyła on 05/03/2019.
//  Copyright © 2019 Grzegorz Przybyła. All rights reserved.
//

import Foundation
import Alamofire

class URLRequestsSniffer {
    // MARK: - Properties
    let notificationCenter: NotificationCenter
    private var tokens: [Any] = []
    // MARK: - Lifecycle
    init(notificationCenter: NotificationCenter = .default) {
        self.notificationCenter = notificationCenter
        start()
    }
    deinit { stop() }
    // MARK: - Private
    private func start() {
        let token = notificationCenter.addObserver(forName: Request.didComplete,
                                                   object: nil,
                                                   queue: nil) { [weak self] (notification) in
                                                    self?.handleRequestDidComplete(notification)
        }
        tokens.append(token)
    }
    private func stop() {
        tokens.forEach { token in
            notificationCenter.removeObserver(token)
        }
    }
    
    private func handleRequestDidComplete(_ notification: Notification) {
        guard let request = notification.request as? DataRequest else { return }
        debugPrint("Alamofire did performed request cURLed:")
        debugPrint(request)
        if let responseData = request.data,
            let prettyPrinderJSONResponse = responseData.prettyPrintedJSONString {
            print("Response data: \(prettyPrinderJSONResponse)")
        }
    }
}
