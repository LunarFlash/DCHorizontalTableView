//
//  DCHorizontalCell.m
//  DCHorizontalTable
//
//  Created by Yi Wang on 2/25/14.
//  Copyright (c) 2014 Dicey. All rights reserved.
//

#import "DCHorizontalCell.h"
#import "ControlVariables.h"
#import "DCItemCell.h"

@implementation DCHorizontalCell
@synthesize items, horizontalTableView;


- (NSString *) reuseIdentifier
{
    return @"HorizontalCell";
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        // Allocate a UITableView and store it in our local variable named horizontalTableView.
        self.horizontalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kCellHeight, kTableLength)];
        self.horizontalTableView.showsVerticalScrollIndicator = NO;
        self.horizontalTableView.showsHorizontalScrollIndicator = NO;
        
        // making a call to Core Graphic’s API in order to rotate our view 90 degrees counter clockwise. That’s what the -M_PI * 0.5 value is telling the API.
        self.horizontalTableView.transform = CGAffineTransformMakeRotation(-M_PI * 0.5);
        
        // After rotating our table we set the table view’s frame again. You might be asking yourself why we created a frame in the table’s initializer, well since we now rotated it we must reset the values of the table. And since a UITableView cannot be instantiated with a simple call to init, we must repeat this process.
        [self.horizontalTableView setFrame:CGRectMake(kRowHorizontalPadding * 0.5, kRowVerticalPadding * 0.5, kTableLength - kRowHorizontalPadding, kCellHeight)];
        
        
        // Next up we set the height of our table view’s rows, but since our table is now rotated and appears horizontally, the row height is actually the width of our cell now, which is why we use the kCellWidth constant. It’s just a game of words because Apple’s API refers to a table vertically but we are using it horizontally, nothing tricky here.
        self.horizontalTableView.rowHeight = kCellWidth;
        self.horizontalTableView.backgroundColor = kHorizontalTableBackgroundColor;
        
        self.horizontalTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.horizontalTableView.separatorColor = [UIColor clearColor];
        
        self.horizontalTableView.dataSource = self;
        self.horizontalTableView.delegate = self;
        [self addSubview:self.horizontalTableView];
    }
    
    return self;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Table View Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create string for the reuse identifier of our article cells, notice we used the same reuse identifier as we did in the DCItemCell class.
    static NSString *CellIdentifier = @"ItemCell";
    // Create a new DCItemCell cell, we use the standard dequeueReusableCellWithIdentifier method provided to us by UITableView, except that it returns a regular UITableViewCell, so we cast it to our custom subclass.
    DCItemCell *cell = (DCItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // If we don’t get returned a reusable cell we allocate and initialize one with a custom frame that positions it at the very top left corner of its container and makes it the same width and height as our cell.
    if (cell == nil)
    {
        cell = [[DCItemCell alloc] initWithFrame:CGRectMake(0, 0, kCellWidth, kCellHeight)];
    }
    
    // In order to set the image and title of our cell we just fetch the current item dictionary from our dataList array and set the thumbnail image and article title accordingly.
    NSDictionary *currentItem = [self.items objectAtIndex:indexPath.row];
    
    cell.thumbnail.image = [UIImage imageNamed:[currentItem objectForKey:@"ImageName"]];
    cell.titleLabel.text = [currentItem objectForKey:@"Title"];
    
   
    return cell;
}





@end

