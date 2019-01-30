//
//  ViewController.m
//  RPCanvas
//
//  Created by Rishil Patel on 28/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

#import "ViewController.h"
#import "RPDrawView.h"
#import "ColorButton.h"
// Declare for pencil width, pencil pointshape and other constant value for this class only because small app.
static float RPPencil_width = 16;
static CGLineCap RPPencil_PointShape = kCGLineCapRound;
static NSString *AppTitle = @"RPCanvas";
static NSString *TitleClear = @"CLEAR";
static NSString *TitleRedBtn = @"R";
static NSString *TitleGreenBtn = @"G";
static NSString *TitleBlueBtn = @"B";
@interface ViewController (){
    CGPoint RPpencil_PrevPoint;
    UIColor *colorPencil;
}
@property (weak, nonatomic) IBOutlet RPDrawView *drawView;
@property (weak, nonatomic) IBOutlet ColorButton *btnRed;
@property (weak, nonatomic) IBOutlet ColorButton *btnGreen;
@property (weak, nonatomic) IBOutlet ColorButton *btnBlue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInitialUI];
}
// MARK:- Button clear action [clear drawing]
-(IBAction)action_Clear:(UIBarButtonItem *)sender
{
    [_drawView clearCanvas];
}
// MARK:- Button set color and selected border
-(IBAction)action_Color:(ColorButton *)sender{
    colorPencil = sender.backgroundColor;
    if(colorPencil == [UIColor redColor]){
        [self selectionRed];
    }else if(colorPencil == [UIColor greenColor]){
        [self selectionGreen];
    }else{
        [self selectionBlue];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
// MARK:- Start Touch event for drawing
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    RPpencil_PrevPoint = [touch locationInView:self.view];
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [_drawView.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextSetLineCap(context, RPPencil_PointShape);
    CGContextSetLineWidth(context, RPPencil_width);
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), colorPencil.CGColor);
    CGContextMoveToPoint(context, RPpencil_PrevPoint.x, RPpencil_PrevPoint.y);
    CGContextAddLineToPoint(context, RPpencil_PrevPoint.x, RPpencil_PrevPoint.y);
    CGContextStrokePath(context);
    _drawView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
// MARK:- End Touch event and point
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [_drawView.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, RPpencil_PrevPoint.x, RPpencil_PrevPoint.y);
    CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    CGContextSetLineCap(context, RPPencil_PointShape);
    CGContextSetLineWidth(context, RPPencil_width );
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), colorPencil.CGColor);
    CGContextStrokePath(context);
    _drawView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    RPpencil_PrevPoint = currentPoint;
}
-(void)setInitialUI{
    self.title = AppTitle;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:TitleClear style:UIBarButtonItemStylePlain target:self action:@selector(action_Clear:)];
    colorPencil = [UIColor redColor];
    [_btnRed setColor_Shadow:[UIColor redColor] text:TitleRedBtn withSelectedBorder:YES];
    [_btnGreen setColor_Shadow:[UIColor greenColor] text:TitleGreenBtn withSelectedBorder:NO];
    [_btnBlue setColor_Shadow:[UIColor blueColor] text:TitleBlueBtn withSelectedBorder:NO];
}
// MARK:- Red selection flag true
-(void)selectionRed{
    [_btnRed setSelectedBorder:YES];
    [_btnGreen setSelectedBorder:NO];
    [_btnBlue setSelectedBorder:NO];
}
// MARK:- Green selection flag true
-(void)selectionGreen{
    [_btnRed setSelectedBorder:NO];
    [_btnGreen setSelectedBorder:YES];
    [_btnBlue setSelectedBorder:NO];
}
// MARK:- Blue selection flag true
-(void)selectionBlue{
    [_btnRed setSelectedBorder:NO];
    [_btnGreen setSelectedBorder:NO];
    [_btnBlue setSelectedBorder:YES];
}
@end
