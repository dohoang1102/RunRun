//
//  HelloWorldLayer.m
//  RunRun
//
//  Created by Mitch Carroll on 2/29/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCTouchDispatcher.h"

CCSprite *seeker1;
//CCSprite *cocosGuy;
CCSprite *megg;

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        seeker1 = [CCSprite spriteWithFile:@"seeker.png"];
        seeker1.position = ccp(50,100);
        [self addChild:seeker1];
        
        megg = [CCSprite spriteWithFile:@"megg.png"];
        megg.position = ccp(200,300);
        [self addChild:megg];
        
        
        //schedule a repeatiing callback on every frame
        [self schedule:@selector(nextFrame:)];
        self.isTouchEnabled = YES;
	
	}
	return self;
}

- (void) registerWithTouchDispatcher{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches: YES];
}


- (void) nextFrame:(ccTime)dt {
    seeker1.position = ccp(seeker1.position.x + 100*dt, seeker1.position.y);
    if (seeker1.position.x > 480 + 23){
        seeker1.position = ccp(-32, seeker1.position.y);
    }
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    return YES;
}

- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [self convertTouchToNodeSpace:touch];
    [megg stopAllActions];
    [megg runAction: [CCMoveTo actionWithDuration:1 position:location]];
    
    

}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
