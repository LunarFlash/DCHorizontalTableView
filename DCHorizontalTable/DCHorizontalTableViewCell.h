//
//  DCHorizontalCell.h
//  DCHorizontalTable
//
//  Created by Yi Wang on 2/25/14.
//  Copyright (c) 2014 Dicey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCHorizontalTableViewCell : UITableViewCell <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *horizontalTableView;
@property (nonatomic, strong) NSArray *items;

@end
