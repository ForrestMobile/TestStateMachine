//
//  BaseState.h
//  TestStateMachine
//
//  Created by Lin Shi on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseState : NSOperation{
    NSString    *stateName;
    
    NSOperationQueue *stateQueue;
}

- (id) initWithName:(NSString*)name;

- (void) beforeRun;
- (void) run;
- (void) afterRun;

- (void) fireState:(BaseState*)newState;


@end
