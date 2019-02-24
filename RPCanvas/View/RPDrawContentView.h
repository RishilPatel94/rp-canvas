//
//  RPDrawContentView.h
//  RPCanvas
//
//  Created by Alpesh Patel on 24/02/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPDrawView.h"
NS_ASSUME_NONNULL_BEGIN

@interface RPDrawContentView : UIView
{
    CGPoint RPpencil_PrevPoint;
    UIColor *colorPencil;
    RPDrawView *drawView;
    float RPPencil_width;
}
-(void)changePencilColor:(UIColor *)clr;
-(UIColor *)currentPencilColor;
-(void)clearCanvas;
-(void)setPencilWidth:(float)enterWidth;

@end

NS_ASSUME_NONNULL_END
