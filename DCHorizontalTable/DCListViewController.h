//
//  DCListViewController.h
//  DCHorizontalTable
//
//  Created by Yi Wang on 2/25/14.
//  Copyright (c) 2014 Dicey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCListViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSDictionary *dataDictionary;

@end
