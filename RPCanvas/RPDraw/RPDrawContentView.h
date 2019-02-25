//
//  RPDrawContentView.h
//  RPCanvas
//
//  Created by Rishil Patel on 24/02/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPDrawView.h"
NS_ASSUME_NONNULL_BEGIN

@interface RPDrawContentView : UIView
{
    CGPoint RPpencil_PrevPoint;
    RPDrawView *drawView;
}
@property (nonatomic) IBInspectable UIColor *pencilColor;
@property (nonatomic) IBInspectable float pencilWidth;
-(void)changePencilColor:(UIColor *)clr;
-(void)clearCanvas;
-(void)setPencilWidth:(float)enterWidth;

@end

NS_ASSUME_NONNULL_END
