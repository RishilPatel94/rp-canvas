//
//  RPDrawView.m
//  RPCanvas
//
//  Created by Rishil Patel on 29/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

#import "RPDrawView.h"

@implementation RPDrawView
- (void)awakeFromNib
{
    [super awakeFromNib];
}
-(instancetype)init{
    return [super init];
}
// MARK:- Clear Image Imageview
-(void)clearCanvas{
    self.image = nil;
}

@end
