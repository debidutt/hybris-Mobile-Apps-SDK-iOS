//
// HYCategoryCell.m
// [y] hybris Platform
//
// Copyright (c) 2000-2013 hybris AG
// All rights reserved.
//
// This software is the confidential and proprietary information of hybris
// ("Confidential Information"). You shall not disclose such Confidential
// Information and shall use it only in accordance with the terms of the
// license agreement you entered into with hybris.
//


#import "HYCategoryCell.h"


@implementation HYCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];

    // Reset all fields to remove examples from storyboard
    self.textLabel.text = @"";
    self.textLabel.font = UIFont_defaultFont;
    self.textLabel.textColor = UIColor_textColor;
    self.textLabel.backgroundColor = [UIColor clearColor];

    // Line
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10.0, self.frame.size.height - 1.0, self.frame.size.width - 20.0, 1.0)];
    lineView.backgroundColor = UIColor_dividerBorderColor;
    [self addSubview:lineView];

    // Selected state
    self.textLabel.highlightedTextColor = UIColor_lightBlueTextTint;
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    UIView *backgroundSeparatorView = [[UIView alloc] initWithFrame:CGRectMake(10.0, self.frame.size.height - 1.0, self.frame.size.width - 20.0, 1.0)];
    backgroundSeparatorView.backgroundColor = UIColor_dividerBorderColor;
    [self.selectedBackgroundView addSubview:backgroundSeparatorView];

    // Indicator
    self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"disclosure.png"] highlightedImage:[UIImage imageNamed:@"disclosure-on.png"]];
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        // Initialization code
    }

    return self;
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    // Re-set the background color of the line
    for (UIView *v in self.selectedBackgroundView.subviews) {
        v.backgroundColor = UIColor_dividerBorderColor;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:NO];

    // Re-set the background color of the line
    for (UIView *v in self.selectedBackgroundView.subviews) {
        v.backgroundColor = UIColor_dividerBorderColor;
    }

    if (selected && animated) {
        [UIView animateWithDuration:0.5 animations:^() {
                self.backgroundView.alpha = 0.5;
            }];
    }

    if (!selected && animated) {
        [UIView animateWithDuration:0.5 animations:^() {
                self.backgroundView.alpha = 1.0;
            }];
    }
}

@end
