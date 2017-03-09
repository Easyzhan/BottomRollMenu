//
//  RollCollectionViewCell.m
//  BottomRollMenu
//
//  Created by Zin_戦 on 17/3/9.
//  Copyright © 2017年 Zin_戦. All rights reserved.
//

#import "RollCollectionViewCell.h"

@implementation RollCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.layer.cornerRadius = 10;
    self.imageView.layer.cornerRadius = 10;
    
}

@end
