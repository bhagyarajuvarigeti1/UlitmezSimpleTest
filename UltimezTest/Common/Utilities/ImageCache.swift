//
//  ImageCache.swift
//  UltimezTest
//
//  Created by bhagyaraju on 29/09/24.
//

import UIKit
import SwiftUI


struct CachedAsyncImage: View {
    @StateObject private var loader = ImageLoader()
    let urlString: String
    
    var body: some View {
        if let image = loader.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        } else {
            ProgressView() // Placeholder while the image is loading
                .frame(width: 300, height: 200)
                .onAppear {
                    loader.loadImage(from: urlString)
                }
        }
    }
}


class ImageCache {
    static let shared = ImageCache()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    // Store an image in the cache
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    // Retrieve an image from the cache
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}


class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private var urlString: String?
    
    func loadImage(from urlString: String) {
        self.urlString = urlString
        
        // Check if the image exists in the cache
        if let cachedImage = ImageCache.shared.getImage(forKey: urlString) {
            self.image = cachedImage
            return
        }
        
        // If not, download the image
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let downloadedImage = UIImage(data: data) else {
                return
            }
            
            // Cache the downloaded image
            ImageCache.shared.setImage(downloadedImage, forKey: urlString)
            
            // Update the image on the main thread
            DispatchQueue.main.async {
                self.image = downloadedImage
            }
        }
        
        task.resume()
    }
}
