//
//  Dictionary+Extensions.swift
//  Tellah
//
//  Created by Angelo Di Paolo on 2/10/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation

// MARK: - NSData Encoding

extension Dictionary {
    var jsonEncodedData: NSData? {
        guard let json = self as? AnyObject else { return nil }
        return try? NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions())
    }
    
    var percentEncodedData: NSData? {
        let components = NSURLComponents()
        components.queryItems = queryItems
        return components.query?.dataUsingEncoding(NSUTF8StringEncoding)
    }
}

// MARK: - NSURLQueryItem

extension Dictionary {
    var queryItems: [NSURLQueryItem] {
        var items = [NSURLQueryItem]()
        
        for (name, value) in self {
            let item = NSURLQueryItem(name: "\(name)", value: "\(value)")
            items.append(item)
        }
        
        return items
    }
}
