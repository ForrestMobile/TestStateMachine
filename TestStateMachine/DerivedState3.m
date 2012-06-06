//
//  DerivedState3.m
//  TestStateMachine
//
//  Created by Lin Shi on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DerivedState3.h"

@implementation DerivedState3

- (void) beforeRun{
    [super beforeRun];
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
}
- (void) run{
    [super run];
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"runView3" object:nil]];

}
- (void) afterRun{
    [super afterRun];
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
}

@end
