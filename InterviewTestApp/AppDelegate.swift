//
//  AppDelegate.swift
//  InterviewTestApp
//
//  Created by Micha Mazaheri on 5/26/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate {
    
    @IBOutlet var window: NSWindow!
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let images = downloadImages(imageUrls: [
            "https://homepages.cae.wisc.edu/~ece533/images/boat.png",
            "https://homepages.cae.wisc.edu/~ece533/images/monarch.png",
            "http://httpbin.org/image/jpeg"
        ])
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}

