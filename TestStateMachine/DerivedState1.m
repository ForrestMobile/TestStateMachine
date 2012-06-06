//
//  DerivedState1.m
//  TestStateMachine
//
//  Created by Lin Shi on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DerivedState1.h"
#import "DerivedState2.h" 

@implementation DerivedState1

- (void) beforeRun{
    [super beforeRun];
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
    
    DerivedState2 *newState = [[DerivedState2 alloc] initWithName:@"state2"];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"goto2" object:nil queue:self->stateQueue usingBlock:^(NSNotification *note) {
        //
        NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
        [self fireState:newState];
    }];
     
}
- (void) run{
    [super run];
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"runView1" object:nil]];
    
}
- (void) afterRun{
    [super afterRun];
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
}

- (void) main{
    //[super main];
    [self beforeRun];
    
    [self run];
}


@end
