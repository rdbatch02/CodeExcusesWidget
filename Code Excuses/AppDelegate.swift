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
    var excuse: String = ""
    @IBOutlet weak var ExcuseText: NSTextField!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        getNewExcuse()
    }
    
    func getNewExcuse()
    {
        var request = HTTPTask();
        request.GET("http://www.codingexcuses.com/?jsonp", parameters: nil,
            success: {(response: HTTPResponse) in
                if response.responseObject != nil {
                    let data = response.responseObject as NSData
                    let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                    self.setExcuse(String(str!)[20...str!.length-5])
                }
            }, failure: {(error: NSError) in
                println("Error");
        })
    }
    
    func setExcuse(value: String)
    {
        self.excuse = value
        self.ExcuseText.stringValue = self.excuse
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        println(self.excuse)
    }


}

