//
//  ItemDetailViewController.h
//  AmazStore
//
//  Created by Aadil Ali on 3/12/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CacheImage;
@class AppConstants;

@interface ItemDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *itemImgView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemAdditionDateLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (weak, nonatomic)  NSString *itemName;
@property (weak, nonatomic)  NSString *itemPrice;
@property (weak, nonatomic)  NSString *itemImageURL;




@end

NS_ASSUME_NONNULL_END
