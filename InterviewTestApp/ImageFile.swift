//
//  ImageFile.swift
//  InterviewTestApp
//
//  Created by Micha Mazaheri on 5/26/21.
//

import Foundation
import AppKit

class ImageFile: NSObject {
    @objc var name: String
    @objc var url: URL
    @objc var image: NSImage
    
    init(name: String, url: URL, image: NSImage) {
        self.name = name
        self.url = url
        self.image = image
    }
}
