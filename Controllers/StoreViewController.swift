//
//  ViewController.swift
//  AmazStore
//
//  Created by Aadil Ali on 3/11/21.
//  Copyright © 2021 Aadil Ali. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var storeTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var storeViewModel : StoreViewModel!
    
    private var dataSource : StoreTableViewDataSource<StoreTableViewCell,StoreData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = AppConstants.storeVCTitle
        callToViewModelForUIUpdate()
    }

    
    func callToViewModelForUIUpdate() -> Void {
        self.activityIndicator.startAnimating()
        self.storeViewModel = StoreViewModel()
        self.storeViewModel.bindStoreViewModelToController = {
            
            self.updateDataSource()
            DispatchQueue.main.async {
                self.storeTableView.reloadData()
            }
            
        }
    }

    func updateDataSource(){
        let imageCache = CacheImage()
        self.dataSource = StoreTableViewDataSource(cellIdentifier: AppConstants.storeTableCellIdentifier, items: self.storeViewModel.storeData.results, configureCell: { (cell, storeData) in
            
            cell.storeItem = storeData
            
//            cell.itemNameLabel.text = storeData.itemName
//            cell.itemPriceLabel.text = storeData.itemPrice
//
            imageCache.loadImageWithUrl(URL.init(string: (storeData.itemImages[0]))!) { (isSuccess, imageDownloaded) in
                cell.itemImgView?.image = imageDownloaded

            }
            
//            DispatchQueue.main.async {
//            imageCache.loadImageWithUrl(URL.init(string: (storeData.itemThumbnails[0]))!, imageView: cell.itemImgView)
//                cell.itemImgView.setNeedsDisplay()
//                cell.itemImgView.layoutIfNeeded()
//            }
            
            
        })
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.storeTableView.dataSource = self.dataSource
            self.storeTableView.reloadData()
        }
    }
}
extension StoreViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storeyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let itemDetailVC = storyboard?.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
        let itemDetail = self.storeViewModel.storeData.results[indexPath.row]
        itemDetailVC.itemName = itemDetail.itemName as NSString
        itemDetailVC.itemPrice = itemDetail.itemPrice as NSString
        itemDetailVC.itemImageURL = itemDetail.itemImages[0] as NSString
        self.navigationController?.pushViewController(itemDetailVC, animated: true)
    }
}
