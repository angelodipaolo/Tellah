//
//  URLSession.swift
//  Tellah
//
//  Created by Angelo Di Paolo on 2/10/16.
//  Copyright © 2016 Angelo Di Paolo. All rights reserved.
//

import Foundation

public protocol URLSession {
    func dataTask(request request: URLRequest, completion: (NSData?, NSURLResponse?, NSError?) -> Void) -> URLSessionDataTask
}

extension NSURLSession: URLSession {
    public func dataTask(request request: URLRequest, completion: (NSData?, NSURLResponse?, NSError?) -> Void) -> URLSessionDataTask {
        return dataTaskWithRequest(request.urlRequestValue, completionHandler: completion)
    }
}

public protocol URLSessionDataTask {}

extension NSURLSessionDataTask: URLSessionDataTask {}
