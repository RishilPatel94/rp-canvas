//
//  ViewController.m
//  RPCanvas
//
//  Created by Rishil Patel on 28/01/19.
//  Copyright © 2019 Rishil Patel. All rights reserved.
//

#import "ViewController.h"
#import "RPDrawContentView.h"
static NSString *AppTitle = @"RPCanvas";
static NSString *TitleClear = @"CLEAR";
@interface ViewController (){
    IBOutlet RPDrawContentView *drawView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInitialUI];
}
// MARK:- Button clear action [clear drawing]
-(IBAction)action_Clear:(UIBarButtonItem *)sender
{
    [drawView clearCanvas];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
// MARK:- My View Controller's Initial changes
-(void)setInitialUI{
    self.title = AppTitle;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:TitleClear style:UIBarButtonItemStylePlain target:self action:@selector(action_Clear:)];
}
@end
