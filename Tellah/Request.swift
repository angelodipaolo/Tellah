//
//  Request.swift
//  Tellah
//
//  Created by Angelo Di Paolo on 2/10/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation

public protocol Request: URLRequest, URL, RequestMethod {
    var headers: [String: String] {get}
    var body: NSData? {get}
}

extension Request {
    var body: NSData? {
        return nil
    }
    
    var headers: [String: String] {
        return [String: String]()
    }
}

// MARK: - URLRequest

extension Request {
    var urlRequestValue: NSURLRequest {
        let urlRequest = NSMutableURLRequest(URL: url)
        urlRequest.HTTPMethod = method.rawValue
        urlRequest.HTTPBody = body
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}

public protocol URLRequest {
    var urlRequestValue: NSURLRequest {get}
}

public protocol URL {
    var url: NSURL {get}
}

public protocol RequestMethod {
    var method: HTTPMethod {get}
}
