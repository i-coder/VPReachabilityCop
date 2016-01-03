//
//  VPReachabilityCop.swift
//  https://www.linkedin.com/profile/view?id=AAIAABVhA68BB-a7W90VkZvv4fFc2sINcamGYzw&trk=nav_responsive_tab_profile
//
//  Created by Vlad Petruk on 1/3/16.
//  Copyright © 2016 Vlad Petruk. All rights reserved.
//

import UIKit

enum StatusCode: Int {
    case OK = 200
}

class VPReachabilityCop: NSObject {
    class func isConnectedToNetwork() -> Bool {
        var status: Bool = false
        let url = NSURL(string: "https://apple.com/")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "HEAD"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        
        var response: NSURLResponse?
        do {
            _ = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
        } catch (let error) {
            print(error)
        }
        if let httpResponse = response as? NSHTTPURLResponse {
            let statusCode = StatusCode(rawValue: httpResponse.statusCode)
            if statusCode ==  StatusCode.OK {
                status = true
            }
        }
        return status
    }
    
    class func checkNetworkConnection(success: (() -> Void)?, failure: (() -> Void)?) {
        if !self.isConnectedToNetwork() {
            failure?()
        } else {
            success?()
        }
    }
}
