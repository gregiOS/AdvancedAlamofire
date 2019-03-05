//
//  Data+PrettyJSON.swift
//  AdvancedAlamofire
//
//  Created by Grzegorz Przybyła on 05/03/2019.
//  Copyright © 2019 Grzegorz Przybyła. All rights reserved.
//

import Foundation

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
