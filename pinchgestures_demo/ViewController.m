//
//  ViewController.m
//  pinchgestures_demo
//
//  Created by ronakj on 4/13/16.
//  Copyright (c) 2016 com.ronak.zaptech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void)handlePinchWithGestureRecognizer:(UIPinchGestureRecognizer *)pinchGestureRecognizer;
-(void)handleRotationWithGestureRecognizer:(UIRotationGestureRecognizer *)rotationGestureRecognizer;


-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;


-(void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer;

-(void)slideToLeftWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer;
-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mylongview.hidden=YES;
//    self.secview.hidden=YES;
//    self.thrdview.hidden=YES;
//    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchWithGestureRecognizer:)];
    
    
   [self.myview addGestureRecognizer:pinchGestureRecognizer];
  //[self.secview addGestureRecognizer:pinchGestureRecognizer];
//    [self.thrdview addGestureRecognizer:pinchGestureRecognizer];
    
    
    
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotationWithGestureRecognizer:)];
    [self.myview addGestureRecognizer:rotationGestureRecognizer];
//     [self.secview addGestureRecognizer:rotationGestureRecognizer];
//     [self.thrdview addGestureRecognizer:rotationGestureRecognizer];
    
    
   UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
       [self.myview addGestureRecognizer:singleTapGestureRecognizer];
    
    self.lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures:)];
    
    self.lpgr.minimumPressDuration = 1;
    self.lpgr.allowableMovement = 100.0f;
    [self.view addGestureRecognizer:self.lpgr];
    
    
    UIScreenEdgePanGestureRecognizer *leftEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftEdgeGesture:)];
    leftEdgeGesture.edges = UIRectEdgeLeft;
    leftEdgeGesture.delegate = self;
    [self.view addGestureRecognizer:leftEdgeGesture];

    _centerX = self.view.bounds.size.width / 2;
    
    
    
    
    UISwipeGestureRecognizer *swipeRightOrange = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToRightWithGestureRecognizer:)];
    swipeRightOrange.direction = UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer *swipeLeftOrange = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToLeftWithGestureRecognizer:)];
    swipeLeftOrange.direction = UISwipeGestureRecognizerDirectionLeft;
    
    
    [self.myview addGestureRecognizer:swipeRightOrange];
    [self.myview addGestureRecognizer:swipeLeftOrange];
    
    UISwipeGestureRecognizer *swipeRightBlack = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToRightWithGestureRecognizer:)];
    swipeRightBlack.direction = UISwipeGestureRecognizerDirectionRight;
    [self.secview addGestureRecognizer:swipeRightBlack];
    
    UISwipeGestureRecognizer *swipeLeftGreen = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToLeftWithGestureRecognizer:)];
    swipeLeftGreen.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.thrdview addGestureRecognizer:swipeLeftGreen];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    [self.panview addGestureRecognizer:panGestureRecognizer];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)handlePinchWithGestureRecognizer:(UIPinchGestureRecognizer *)pinchGestureRecognizer{
    pinchGestureRecognizer.view.transform = CGAffineTransformScale(pinchGestureRecognizer.view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
    
    pinchGestureRecognizer.scale = 1.0;
    
    
}
-(void)handleRotationWithGestureRecognizer:(UIRotationGestureRecognizer *)rotationGestureRecognizer{
    self.myview.transform = CGAffineTransformRotate(self.myview.transform, rotationGestureRecognizer.rotation);
//    self.secview.transform = CGAffineTransformRotate(self.secview.transform, rotationGestureRecognizer.rotation);
//    self.thrdview.transform = CGAffineTransformRotate(self.thrdview.transform, rotationGestureRecognizer.rotation);
    rotationGestureRecognizer.rotation = 0.0;
}


-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    CGFloat newWidth = 100.0;
    if (self.myview.frame.size.width == 100.0) {
        newWidth = 400.0;
    }
    
    CGPoint currentCenter = self.myview.center;
    
    self.myview.frame = CGRectMake(self.myview.frame.origin.x, self.myview.frame.origin.y, newWidth, self.myview.frame.size.height);
    self.myview.center = currentCenter;
}
- (void)handleLongPressGestures:(UILongPressGestureRecognizer *)sender
{
    if ([sender isEqual:self.lpgr]) {
        if (sender.state == UIGestureRecognizerStateBegan)
        {
            self.mylongview.hidden=NO;
            /* UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Gestures" message:@"Long Gesture Detected" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [alertView show];*/
        }
    }
}
- (void)handleLeftEdgeGesture:(UIScreenEdgePanGestureRecognizer *)gesture {
    // Get the current view we are touching
    UIView *view = [self.view hitTest:[gesture locationInView:gesture.view] withEvent:nil];
    
    if(UIGestureRecognizerStateBegan == gesture.state ||
       UIGestureRecognizerStateChanged == gesture.state) {
        CGPoint translation = [gesture translationInView:gesture.view];
        // Move the view's center using the gesture
        view.center = CGPointMake(_centerX + translation.x, view.center.y);
    } else {// cancel, fail, or ended
        // Animate back to center x
        [UIView animateWithDuration:.3 animations:^{
            
            view.center = CGPointMake(_centerX, view.center.y);
        }];
    }
}
-(void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    [UIView animateWithDuration:0.5 animations:^{
        self.myview.frame = CGRectOffset(self.myview.frame, 320.0, 0.0);
        self.secview.frame = CGRectOffset(self.secview.frame, 320.0, 0.0);
        self.thrdview.frame = CGRectOffset(self.thrdview.frame, 320.0, 0.0);
    }];
}
-(void)slideToLeftWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    [UIView animateWithDuration:0.5 animations:^{
        self.myview.frame = CGRectOffset(self.myview.frame, -320.0, 0.0);
        self.secview.frame = CGRectOffset(self.secview.frame, -320.0, 0.0);
        self.thrdview.frame = CGRectOffset(self.thrdview.frame, -320.0, 0.0);
    }];
}
-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    
    self.panview.center = touchLocation;
    
}

@end
