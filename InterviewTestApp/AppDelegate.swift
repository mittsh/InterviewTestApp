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
    @IBOutlet var tableView: NSTableView!
    
    var images: [ImageFile]
    
    override init() {
        images = []
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let newImages = downloadImages(imageUrls: [
            "https://homepages.cae.wisc.edu/~ece533/images/boat.png",
            "https://homepages.cae.wisc.edu/~ece533/images/monarch.png",
            "https://homepages.cae.wisc.edu/~ece533/images/baboon.png"
        ])
        
        print(newImages)
        images = newImages
        tableView.reloadData()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return images[row]
    }
}
