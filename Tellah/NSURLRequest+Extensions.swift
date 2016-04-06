//
//  NSURLRequest+Extensions.swift
//  Tellah
//
//  Created by Angelo Di Paolo on 2/10/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation

extension NSURLRequest: URLRequest {
    public var urlRequestValue: NSURLRequest {
        return self
    }
}

extension NSMutableURLRequest {
    public func setQueryParameters(parameters: [String: String]) {
        guard
            let url = URL,
            let components = NSURLComponents(URL: url, resolvingAgainstBaseURL: false) else {
                return
        }
        
        components.queryItems = parameters.queryItems
        URL = components.URL
    }
    
    public func setJSON(json: AnyObject, options: NSJSONWritingOptions) throws {
        HTTPBody = try NSJSONSerialization.dataWithJSONObject(json, options: options)
    }
    
    public func setJSON(json: AnyObject) throws {
        try setJSON(json, options: NSJSONWritingOptions())
    }
}
