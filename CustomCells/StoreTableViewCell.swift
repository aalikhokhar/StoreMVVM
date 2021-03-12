//
//  EmployeTableViewCell.swift
//  AmazStore
//
//  Created by Aadil Ali on 3/11/21.
//  Copyright © 2021 Aadil Ali. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {

   @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImgView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let imageCache = CacheImage()
    
    var storeItem : StoreData? {
        didSet {
            itemPriceLabel.text = storeItem!.itemPrice
            itemNameLabel.text = storeItem?.itemName
            imageCache.loadImageWithUrl(URL.init(string: (storeItem?.itemThumbnails[0])!)!) { (isSuccess, image) in
                self.itemImgView.image = image
                self.activityIndicator.stopAnimating()
            }
            self.setNeedsLayout()
            self.itemImgView.setNeedsLayout()
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
