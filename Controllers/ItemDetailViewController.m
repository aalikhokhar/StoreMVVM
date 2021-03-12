//
//  ItemDetailViewController.m
//  AmazStore
//
//  Created by Aadil Ali on 3/12/21.
//

#import "ItemDetailViewController.h"

#import <AmazStore-Swift.h>

@interface ItemDetailViewController ()

@end



@implementation ItemDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = AppConstants.storeItemDetailVCTitle;
    
    [self setupItemData];
}
- (void)setupItemData{
    
    self.itemNameLabel.text = self.itemName;
    self.itemPriceLabel.text = self.itemPrice;
    
    CacheImage * cacheImage = [[CacheImage alloc]init];
    NSURL * imageURL = [[NSURL alloc] initWithString:self.itemImageURL];

    [cacheImage loadImageWithUrl:imageURL completionHandler:^(BOOL isSuccess, UIImage * imageItem) {
            if (isSuccess){
                self.itemImgView.image = imageItem;
                [self.activityIndicator stopAnimating];
            }
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
