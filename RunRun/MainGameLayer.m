//
//  MainGameLayer.m
//  RunRun
//
//  Created by Mitch Carroll on 3/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TopMenuLayer.h"
#import "MainGameLayer.h"
#import "CCTouchDispatcher.h"

CCSprite *seeker1;
CCSprite *me_gusta;

@implementation MainGameLayer


// on "init" you need to initialize your instance
-(id) init
{
    
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
        // create and initialize our seeker sprite, and add it to this layer
        seeker1 = [CCSprite spriteWithFile: @"seeker.png"];
        seeker1.position = ccp( 50, 100 );
        [self addChild:seeker1];
        
        me_gusta = [CCSprite spriteWithFile: @"megg.png"];
        me_gusta.position = ccp( 200, 300 );
        [self addChild:me_gusta];
        
        
        
        // schedule a repeating callback on every frame
        [self schedule:@selector(nextFrame:)];
        
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
                                                         priority:0
                                                  swallowsTouches:YES];
        //self.isTouchEnabled = YES;
        
        
	}
	return self;
}

//-(void) registerWithTouchDispatcher
//{
//	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
//}

- (void) nextFrame:(ccTime)dt
{
    seeker1.position = ccp(seeker1.position.x + 100 *dt, seeker1.position.y);
    if (seeker1.position.x > 480+32){
        seeker1.position = ccp(-32, seeker1.position.y);
    }
    
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint location = [touch locationInView: [touch view]];
	CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
	[me_gusta stopAllActions];
	[me_gusta runAction: [CCMoveTo actionWithDuration:1 position:convertedLocation]];    
}



+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainGameLayer *layer = [MainGameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


@end
