//
//  RPDrawContentView.m
//  RPCanvas
//
//  Created by Rishil Patel on 24/02/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//
#import "RPDrawContentView.h"
static CGLineCap RPPencil_PointShape = kCGLineCapRound;

@implementation RPDrawContentView
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self confuguration];
}
// MARK:- coniguration with ui and sub objects
-(void)confuguration{
    drawView = [[RPDrawView alloc]init];
    [self addSubview:drawView];
}
// MARK:- set drwchild framwe
-(void)setFrames{
    drawView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}
// MARK:- update subviews frame
-(void)layoutSubviews{
    [self setFrames];
}
// MARK:- set pencil color
-(void)changePencilColor:(UIColor *)clr{
    _pencilColor = clr;
}
// MARK:- change pencil width
-(void)setPencilWidth:(float)enterWidth{
    _pencilWidth = enterWidth;
}
// MARK:- clear drawing data on view
-(void)clearCanvas{
    [drawView clearCanvas];
}
// MARK:- start Touch event and point
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    RPpencil_PrevPoint = [touch locationInView:self];
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [drawView.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    CGContextSetLineCap(context, RPPencil_PointShape);
    CGContextSetLineWidth(context, _pencilWidth);
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), _pencilColor.CGColor);
    CGContextMoveToPoint(context, RPpencil_PrevPoint.x, RPpencil_PrevPoint.y);
    CGContextAddLineToPoint(context, RPpencil_PrevPoint.x, RPpencil_PrevPoint.y);
    CGContextStrokePath(context);
    drawView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
// MARK:- End Touch event and point
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    UIGraphicsBeginImageContext(self.frame.size);
    [drawView.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, RPpencil_PrevPoint.x, RPpencil_PrevPoint.y);
    CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    CGContextSetLineCap(context, RPPencil_PointShape);
    CGContextSetLineWidth(context, _pencilWidth);
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), _pencilColor.CGColor);
    CGContextStrokePath(context);
    drawView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    RPpencil_PrevPoint = currentPoint;
}
@end
