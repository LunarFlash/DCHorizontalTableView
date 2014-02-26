//
//  DCHorizontalCell.h
//  DCHorizontalTable
//
//  Created by Yi Wang on 2/25/14.
//  Copyright (c) 2014 Dicey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCHorizontalCell : UITableViewCell <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) UITableView *horizontalTableView;
@property (nonatomic, retain) NSArray *dataList;

@end
