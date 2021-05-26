//
//  ImageDownloader.swift
//  InterviewTestApp
//
//  Created by Micha Mazaheri on 5/26/21.
//

import Foundation
import AppKit

func downloadImages(imageUrls: [String]) -> [ImageFile] {
    var images: [ImageFile] = []
    
    // create a concurrent queue
    let concurrentQueue = DispatchQueue(label: "myConcurrentQueue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    
    // for each image, download in background
    for i in 0 ..< imageUrls.count {
        concurrentQueue.async {
            do {
                let url = URL(string: imageUrls[i])!
                let data = try Data(contentsOf: url)
                if let image = NSImage(data: data) {
                    let imageFile = ImageFile(name: url.lastPathComponent, url: url, image: image)
                    DispatchQueue.main.async {
                        images.append(imageFile)
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
