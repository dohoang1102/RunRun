//
//  TopMenuLayer.m
//  RunRun
//
//  Created by Mitch Carroll on 3/6/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TopMenuLayer.h"
#import "CCTouchDispatcher.h"
#import "MainGameLayer.h"


@implementation TopMenuLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	TopMenuLayer *layer = [TopMenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


// set up the Menus
-(void) setUpMenus
{
    
	// Create some menu items
	CCMenuItemImage * menuItem1 = [CCMenuItemImage itemFromNormalImage:@"myfirstbutton.png"
                                                         selectedImage: @"myfirstbutton_selected.png"
                                                                target:self
                                                              selector:@selector(menuAction_1:)];
    
	CCMenuItemImage * menuItem2 = [CCMenuItemImage itemFromNormalImage:@"mysecondbutton.png"
                                                         selectedImage: @"mysecondbutton_selected.png"
                                                                target:self
                                                              selector:@selector(menuAction_2:)];
    
    
	CCMenuItemImage * menuItem3 = [CCMenuItemImage itemFromNormalImage:@"mythirdbutton.png"
                                                         selectedImage: @"mythirdbutton_selected.png"
                                                                target:self
                                                              selector:@selector(menuAction_3:)]; 
    
    
	// Create a menu and add your menu items to it
	CCMenu * myMenu = [CCMenu menuWithItems:menuItem1, menuItem2, menuItem3, nil];
    
	// Arrange the menu items vertically
	[myMenu alignItemsVertically];
    
	// add the menu to your scene
	[self addChild:myMenu];
}



- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
	//CGPoint location = [touch locationInView: [touch view]];
	//CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
}


// on "init" you need to initialize your instance
-(id) init
{
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        
        // schedule a repeating callback on every frame
        //[self schedule:@selector(nextFrame:)];
        
        [self setUpMenus];
        
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
                                                         priority:0
                                                  swallowsTouches:YES];
        //self.isTouchEnabled = YES;
        
        
	}
	return self;
}

- (void) menuAction_1: (CCMenuItem  *) menuItem 
{
	NSLog(@"The first menu was called");
    [[CCDirector sharedDirector] replaceScene:
	 [CCTransitionFade transitionWithDuration:0.5f scene:[MainGameLayer scene]]];
    //[[CCDirector sharedDirector] replaceScene: [MainGameLayer scene]];
}
- (void) menuAction_2: (CCMenuItem  *) menuItem 
{
	NSLog(@"The second menu was called");
}
- (void) menuAction_3: (CCMenuItem  *) menuItem 
{
	NSLog(@"The third menu was called");
}




@end
