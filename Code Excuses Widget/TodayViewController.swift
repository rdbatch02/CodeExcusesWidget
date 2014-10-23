//
//  TodayViewController.swift
//  Code Excuses Widget
//
//  Created by Ryan Batchelder on 10/22/14.
//  Copyright (c) 2014 Ryan Batchelder. All rights reserved.
//

import Cocoa
import NotificationCenter
import SwiftHTTPOSX

class TodayViewController: NSViewController, NCWidgetProviding {

    @IBOutlet weak var ExcuseButton: NSButton!
    @IBOutlet weak var ExcuseText: NSTextField!
    @IBAction func CilckRefresh(sender: AnyObject) {
        self.getNewExcuse()
        println("Button click")
        self.view.updateLayer()
    }
    override var nibName: String? {
        return "TodayViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.updateLayer()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        self.getNewExcuse()
        self.view.updateLayer()
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        self.getNewExcuse()
        completionHandler(.NewData)
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
        self.ExcuseText.stringValue = value
    }

}
