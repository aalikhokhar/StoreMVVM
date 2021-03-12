//
//  APIService.swift
//  AmazStore
//
//  Created by Aadil Ali on 3/11/21.
//  Copyright © 2021 Aadil Ali. All rights reserved.
//

import UIKit
import Foundation
class APIService: NSObject {

    private let sourcesURL = URL(string: AppURLs.BASE_URL)!
       
       func apiToGetStoreData(completion : @escaping (Store?) -> ()){
           URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
               if let data = data {
                   
                   let jsonDecoder = JSONDecoder()
                   
                   let empData = try! jsonDecoder.decode(Store.self, from: data)
                       completion(empData)
               }else{
                    completion(nil)
               }
           }.resume()
       }
    
}

