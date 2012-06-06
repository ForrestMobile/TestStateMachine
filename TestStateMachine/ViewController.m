//
//  ViewController.m
//  TestStateMachine
//
//  Created by Lin Shi on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "BaseState.h"
#import "DerivedState1.h"
#import "DerivedState2.h"
#import "DerivedState3.h"

#import "UIViewState1.h"
#import "UIViewState2.h"
#import "UIViewState3.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    
    UIView* view1 = [[UIViewState1 alloc] initWithFrame:self.view.bounds];
    UIView* view2 = [[UIViewState2 alloc] initWithFrame:self.view.bounds];
    UIView* view3 = [[UIViewState3 alloc] initWithFrame:self.view.bounds];
    
    view1.backgroundColor = [UIColor redColor];
    view2.backgroundColor = [UIColor greenColor];
    view3.backgroundColor = [UIColor blueColor];
    
    view1.alpha = 0;
    view2.alpha = 0;
    view3.alpha = 0;


    NSOperationQueue *viewQueue = [[NSOperationQueue alloc] init];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"runView1" object:nil queue:viewQueue usingBlock:^(NSNotification *note) {
        //
        NSLog(@"%s",__PRETTY_FUNCTION__);
        [self.view addSubview:view1];
        [UIView animateWithDuration:1.0 animations:^{
            view1.alpha = 1.0;
        }];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"runView2" object:nil queue:viewQueue usingBlock:^(NSNotification *note) {
        //
        NSLog(@"%s",__PRETTY_FUNCTION__);

        [self.view addSubview:view2];
        
        [UIView transitionFromView:view1 toView:view2 duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            //
            if (finished) {
                [UIView animateWithDuration:1.0 animations:^{
                    view2.alpha = 1.0;
                }]; 
            }
        }];
        
        //sending event 
//        double delayInSeconds2 = 2.0;
//        dispatch_time_t popTime2 = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds2 * NSEC_PER_SEC);
//        dispatch_after(popTime2, dispatch_get_main_queue(), ^(void){
//            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"goto3" object:nil]];
//        });
        
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"runView3" object:nil queue:viewQueue usingBlock:^(NSNotification *note) {
        //
        NSLog(@"%s",__PRETTY_FUNCTION__);

        [self.view addSubview:view3];
        [UIView transitionFromView:view2 toView:view3 duration:1.0 options:UIViewAnimationOptionTransitionCurlUp completion:^(BOOL finished) {
            //
            if (finished) {
                [UIView animateWithDuration:1.0 animations:^{
                    view3.alpha = 1.0;
                }]; 
            }
        }];
    }];
    
    
    BaseState *state1 = [[DerivedState1 alloc] initWithName:@"state1"];
    
    [state1 start];
    
    //sending event 
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"goto2" object:nil]];
        

    });
    

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
