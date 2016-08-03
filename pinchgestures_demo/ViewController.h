//
//  ViewController.h
//  pinchgestures_demo
//
//  Created by ronakj on 4/13/16.
//  Copyright (c) 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h><UIGestureRecognizerDelegate>
CGFloat _centerX
;

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *myview;

@property (strong, nonatomic) IBOutlet UIImageView *myimg;

@property (nonatomic,strong) UILongPressGestureRecognizer *lpgr;
@property (strong, nonatomic) IBOutlet UIView *mylongview;

@property (strong, nonatomic) IBOutlet UIView *secview;

@property (strong, nonatomic) IBOutlet UIView *thrdview;
@property (strong, nonatomic) IBOutlet UIView *panview;

@end

