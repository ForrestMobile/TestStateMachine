//
//  DerivedState2.m
//  TestStateMachine
//
//  Created by Lin Shi on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DerivedState2.h"
#import "DerivedState3.h"

@implementation DerivedState2

- (void) beforeRun{
    [super beforeRun];
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
    
    DerivedState3 *newState = [[DerivedState3 alloc] initWithName:@"state3"];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"goto3" object:nil queue:self->stateQueue usingBlock:^(NSNotification *note) {
        //
        NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
        [self fireState:newState];
    }];
    
}
- (void) run{
    [super run];
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"runView2" object:nil]];

}
- (void) afterRun{
    [super afterRun];
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
}


@end
