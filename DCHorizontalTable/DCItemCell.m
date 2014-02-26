//
//  DCItemCell.m
//  DCHorizontalTable
//
//  Created by Yi Wang on 2/26/14.
//  Copyright (c) 2014 Dicey. All rights reserved.
//

#import "DCItemCell.h"
#import "ControlVariables.h"

@implementation DCItemCell
@synthesize thumbnail, titleLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        
        // Allocate and initialize a new UIImageView and give it a custom frame. As you will see we don’t position it at 0, 0 (the top left corner) but we give it a little bit of padding, as you remember a while back I told you this will allow for separation between each article cell.
        self.thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(kArticleCellHorizontalInnerPadding, kArticleCellVerticalInnerPadding, kCellWidth - kArticleCellHorizontalInnerPadding * 2, kCellHeight - kArticleCellVerticalInnerPadding * 2)];
        // TODO: why isnt this working??
        self.thumbnail.layer.cornerRadius = self.thumbnail.frame.size.width * 0.5f;
        
        // Set the thumbnail as opaque, Apple recommends that all views are opaque when possible as it will greatly improve the performance of our UI.
        self.thumbnail.opaque = YES;
        
        // Add the thumbnail as a subview of the cell’s content view, there’s a difference between adding it as a subview of the cell, and a subview of the cell’s content view!
        [self.contentView addSubview:self.thumbnail];
        

        // Create a UILabel and for the frame we make some adjustments so that it has some padding on the left side (thus preventing text to start from the very edge of the cell) and we make the height of the title label just 37% of the total height of the picture and we move it down a bit so it fits the bottom part of the cell.
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.thumbnail.frame.size.height * 0.632, self.thumbnail.frame.size.width, self.thumbnail.frame.size.height * 0.37)];
        
        // This will make the title not cover the entire article cell and it’s image, but just the bottom half part. We then set the label as opaque, change the background color to a semitransparent gray, give it a white color for the text, set its font to the default bold font with a size of 11 points, allow the label to show in two lines and finally add it as a subview of the thumbnail.
        self.titleLabel.opaque = YES;
        self.titleLabel.backgroundColor = [UIColor colorWithRed:0.694 green:0.388 blue:0.639 alpha:0.9];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:11];
        self.titleLabel.numberOfLines = 2;
        [self.thumbnail addSubview:self.titleLabel];
        
        // Set the background color of the cell to something along the lines of our interface, we change the size of the cell’s background view to the same size as our thumbnail and give it the custom background color we added in our constants file earlier.
        self.backgroundColor = [UIColor whiteColor];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.thumbnail.frame];
        self.selectedBackgroundView.backgroundColor = kHorizontalTableSelectedBackgroundColor;
        
        //  Rotate the cell 90 degrees clockwise by using M_PI * 0.5. If you find this a bit off then let’s remember a few things, these cells will be inside the rotated table view so if we just pass them in as they are, we will see them rotated 90 degrees counter clockwise. In order for us to see them properly we have to rotate them back so they appear normal.
        self.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// Because we are using a custom UITableViewCell, we must manually define the reuse identifier
- (NSString *)reuseIdentifier
{
    return @"ItemCell";
}


@end
