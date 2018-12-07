//
//  Extensions.swift
//  MvvmRxExample
//
//  Created by Mustafa Kuloğlu on 6.12.2018.
//  Copyright © 2018 Mustafa Kuloğlu. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func isFetchIfNeededImage(urlString: String?){
        
        self.image = nil
        
        // check cache for image first
        
        if  let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        let url = NSURL(string: urlString ?? "")
        
        URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error ?? 0)
                return
            }
            
            DispatchQueue.main.async {
                
                if let downloadedImage = UIImage(data: data!) {
                    
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    
                    self.image = downloadedImage
                    
                }
                
            }
            
        }).resume()
        
        
    }
    
    
    
    func load(urlString: String) {
        let url = NSURL(string:urlString)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url! as URL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

