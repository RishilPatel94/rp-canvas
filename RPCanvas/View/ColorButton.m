//
//  ColorButton.m
//  RPCanvas
//
//  Created by Rishil Patel on 29/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

#import "ColorButton.h"

@implementation ColorButton
- (void)awakeFromNib
{
    [super awakeFromNib];
}
// MARK:- Button Shadow and Color
-(void)setColor_Shadow:(UIColor *)color text:(NSString *)text withSelectedBorder:(BOOL)isSelected{
    self.backgroundColor = color;
    [self setTitle:text forState:UIControlStateNormal];
    self.layer.cornerRadius = 8.0f;
    self.layer.masksToBounds = NO;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 2;
    self.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    [self setSelectedBorder:isSelected];
}
// MARK:- Button Selected Border
-(void)setSelectedBorder:(BOOL)isSelected{
    if(isSelected){
        self.layer.borderWidth = 2.0f;
    }else{
       self.layer.borderWidth = 0.0f;
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
