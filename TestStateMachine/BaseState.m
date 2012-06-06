//
//  BaseState.m
//  TestStateMachine
//
//  Created by Lin Shi on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseState.h"

@implementation BaseState

- (id) initWithName:(NSString*)name{
    if (self = [super init]) {
        stateName = name;
        stateQueue = [[NSOperationQueue alloc] init];
        
    }
    return self;
}


- (void) beforeRun{
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);

}
- (void) run{
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);

}
- (void) afterRun{
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);

}

- (void) fireState:(BaseState*)newState{
    [self afterRun];
    
    [newState beforeRun];
    [newState start];
}

- (void) main{
    NSLog(@"%s %@",__PRETTY_FUNCTION__ , stateName);
    
    
    [self run];
    
}
@end
