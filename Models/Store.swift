//
//  Employee.swift
//  AmazStore
//
//  Created by Aadil Ali on 3/11/21.
//  Copyright © 2021 Aadil Ali. All rights reserved.
//

import UIKit

struct Store: Decodable {
    
    let results: [StoreData]
}

// MARK: - EmployeeData
struct StoreData: Decodable {
    let itemName, itemPrice, itemAdditionDate, itemUID: String
    let itemImagesIds, itemThumbnails, itemImages : [String]

    enum CodingKeys: String, CodingKey {
        case itemUID = "uid"
        case itemAdditionDate = "created_at"
        case itemPrice = "price"
        case itemName = "name"
        case itemImagesIds = "image_ids"
        case itemImages = "image_urls"
        case itemThumbnails = "image_urls_thumbnails"
    }
}
