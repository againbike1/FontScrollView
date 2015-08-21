//
//  ViewController.h
//  FontScrollView
//
//  Created by ios on 15/4/27.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSRollingButtonScrollView.h"
#import "LLRollingButtonScrollView.h"
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *tgelabel;

@property (strong, nonatomic) IBOutlet SSRollingButtonScrollView *digitSelector03;
@property (strong, nonatomic) IBOutlet LLRollingButtonScrollView *letterSelector01;

@property (strong, nonatomic) IBOutlet LLRollingButtonScrollView *fontsizeView;
@end

