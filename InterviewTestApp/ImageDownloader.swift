//
//  ImageDownloader.swift
//  InterviewTestApp
//
//  Created by Micha Mazaheri on 5/26/21.
//

import Foundation
import AppKit

func downloadImages(imageUrls: [String]) -> [NSImage] {
    var images: [NSImage] = []
    
    // create a concurrent queue
    let concurrentQueue = DispatchQueue(label: "myConcurrentQueue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    
    // for each image, download in background
    for i in 0 ..< imageUrls.count {
        concurrentQueue.async {
            do {
                let data = try Data(contentsOf: URL(string: imageUrls[i])!)
                if let image = NSImage(data: data) {
                    DispatchQueue.main.async {
                        images.append(image)
                    }
                }
            } catch {
                print("error is \(error.localizedDescription)")
            }
        }
    }
    
    // return the downloaded images
    return images
}
