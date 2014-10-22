//
//  AppDelegate.swift
//  Code Excuses
//
//  Created by Ryan Batchelder on 10/22/14.
//  Copyright (c) 2014 Ryan Batchelder. All rights reserved.
//

import Cocoa
import SwiftHTTPOSX


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        var request = HTTPTask();
        request.GET("http://www.codingexcuses.com/?jsonp", parameters: nil, success: {(response: HTTPResponse) in
            if response.responseObject != nil {
                let data = response.responseObject as NSData
                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                println(str)
            }
            }, failure: {(error: NSError) in
                println("Error");
        })
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

