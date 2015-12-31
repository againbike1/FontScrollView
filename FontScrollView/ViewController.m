//
//  ViewController.m
//  FontScrollView
//
//  Created by ios on 15/4/27.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "ViewController.h"
#import "intforColor.h"
@interface ViewController ()
<SSRollingButtonScrollViewDelegate,LLRollingButtonScrollViewDelegate>

@property (strong, nonatomic) NSMutableArray *fontArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (!self.fontArray) {
        self.fontArray = [NSMutableArray array];
    }
  NSArray *colorArray=@[[UIColor blackColor],
    [UIColor redColor],
    [UIColor blueColor],
    [UIColor greenColor],
    [UIColor yellowColor],
    [UIColor whiteColor],
    [UIColor orangeColor],
    [UIColor brownColor],
    [UIColor purpleColor],
    [UIColor magentaColor],
    [UIColor lightGrayColor],
    [UIColor darkGrayColor],
    [UIColor cyanColor],
    ];

    

    self.digitSelector03.fixedButtonWidth = 60.0f;
    self.digitSelector03.fixedButtonHeight = 40.0f;
    self.digitSelector03.spacingBetweenButtons = 2.0f;

    self.digitSelector03.notCenterButtonTextColor = [UIColor blackColor];
    self.digitSelector03.notCenterButtonBackgroundColor = [UIColor whiteColor];

    self.digitSelector03.stopOnCenter = NO;

    self.digitSelector03.notCenterButtonBackgroundColor = [UIColor whiteColor];
    self.digitSelector03.centerButtonBackgroundColor = [UIColor blackColor];

    [self.digitSelector03 createButtonArrayWithButtonTitles:colorArray andLayoutStyle:SShorizontalLayout];
    

    self.digitSelector03.ssRollingButtonScrollViewDelegate = self;
    
    NSArray *familyNames = [UIFont familyNames];
    
    for( NSString *familyName in familyNames ){
        
        printf( "Family: %s \n", [familyName UTF8String] );
        
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        
        for( NSString *fontName in fontNames ){
            
            printf( "加载tFont: %s \n", [fontName UTF8String] );
            
        }
        
    }
    NSArray *phoneticAlphabet = [NSArray arrayWithObjects:@"黑体",@"楷体",@"雅黑",@"行楷",@"隶书",@"Arial",@"Breair", nil];
    
    

    self.letterSelector01.fixedButtonWidth = 60.0f;
    self.letterSelector01.fixedButtonHeight = 40.0f;
    self.letterSelector01.spacingBetweenButtons = 2.0f;
//    self.letterSelector01.buttonNotCenterFont=[UIFont fontWithName:@" HYLeMiaoTiJ" size:12.0];
//    self.letterSelector01.buttonNotCenterFont = [UIFont systemFontOfSize:14];
//    self.letterSelector01.buttonCenterFont = [UIFont systemFontOfSize:14];
//    self.letterSelector01.notCenterButtonTextColor = [UIColor grayColor];
//    self.letterSelector01.centerButtonTextColor = [UIColor blackColor];
    self.letterSelector01.notCenterButtonBackgroundColor = [UIColor whiteColor];
//    self.letterSelector01.centerButtonBackgroundColor = [UIColor clearColor];

    [self.letterSelector01 createButtonArrayWithButtonTitles:phoneticAlphabet andLayoutStyle:LLhorizontalLayout];
    self.letterSelector01.llRollingButtonScrollViewDelegate = self;

    
    
     NSArray *digits = [NSArray arrayWithObjects:@"10", @"12", @"14", @"16", @"18", @"20", @"24", @"28",@"32",nil];
    
    self.fontsizeView.fixedButtonWidth = 60.0f;
    self.fontsizeView.fixedButtonHeight = 40.0f;
    self.fontsizeView.spacingBetweenButtons = 2.0f;
    self.fontsizeView.notCenterButtonBackgroundColor = [UIColor whiteColor];
    [self.fontsizeView createButtonArrayWithButtonTitles:digits andLayoutStyle:LLhorizontalLayout];
    self.fontsizeView.llRollingButtonScrollViewDelegate = self;
    
    //git commit
    
}

#pragma mark - SSRollingButtonScrollViewDelegate

- (void)rollingScrollViewButtonPushed:(UIButton *)button ssRollingButtonScrollView:(SSRollingButtonScrollView *)rollingButtonScrollView
{
    NSLog(@"pushed: %@", button.backgroundColor);
}

- (void)rollingScrollViewButtonIsInCenter:(UIButton *)button ssRollingButtonScrollView:(SSRollingButtonScrollView *)rollingButtonScrollView
{

    [rollingButtonScrollView scrollViewDidScroll:rollingButtonScrollView];
    NSLog(@"颜色center: %@ %@",button.backgroundColor ,   [intforColor stringTRUeFromColor:  button.titleLabel.backgroundColor]);
    _tgelabel.textColor=button.titleLabel.backgroundColor;
}

#pragma mark - LLRollingButtonScrollViewDelegate

- (void)rollingScrollViewButtonPushed:(UIButton *)button llRollingButtonScrollView:(LLRollingButtonScrollView *)rollingButtonScrollView
{
    NSLog(@"pushed: %@", button.titleLabel.text);

}

- (void)rollingScrollViewButtonIsInCenter:(UIButton *)button llRollingButtonScrollView:(LLRollingButtonScrollView *)rollingButtonScrollView
{
    
    NSString *jieStr=button.titleLabel.text;
    
    NSLog(@"文字%@",jieStr);
    

    if (rollingButtonScrollView==_fontsizeView) {
        _tgelabel.font=[UIFont systemFontOfSize:[jieStr floatValue]];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
