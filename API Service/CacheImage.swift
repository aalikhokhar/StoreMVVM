//
//  CacheImage.swift
//  AmazStore
//
//  Created by Aadil Ali on 3/12/21.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

@objcMembers open class CacheImage: NSObject {

    var imageURL: URL?

    typealias CompletionHandler = (Bool, UIImage) -> Void

    @objc func loadImageWithUrl(_ url: URL,  completionHandler : @escaping CompletionHandler) {

        imageURL = url

//        imageView.image = nil


            // retrieves image if already available in cache
            if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
                completionHandler(true, imageFromCache)
//                DispatchQueue.main.async {
//                    imageView.image = imageFromCache
//                }
//
//                imageView.setNeedsDisplay()
//                imageView.layoutIfNeeded()
//                return
            }else
            {
//                imageView.image = UIImage.init(named: "Default_Image_Thumbnail.png")
            }

            // image does not available in cache.. so retrieving it from url...
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

                if error != nil {
                    print(error as Any)
                    DispatchQueue.main.async(execute: {
                    })
                    return
                }
                
                
                DispatchQueue.main.async(execute: {

                    if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {

                        if self.imageURL == url {
                            completionHandler(true, imageToCache)
//                            DispatchQueue.main.async {
//                                imageView.image = imageToCache
//                                imageView.setNeedsDisplay()
//                                imageView.layoutIfNeeded()
//                            }
//                            imageView.image = imageToCache

                        }

                        imageCache.setObject(imageToCache, forKey: url as AnyObject)
                    }
                })
            }).resume()
        }
}
