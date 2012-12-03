//
//  MenuLayer.m
//  BasicCocos2D
//
//  Created by Fan Tsai Ming on 10/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"

@implementation MenuLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];	
	MenuLayer *layer = [MenuLayer node];
	[scene addChild: layer];
  
	return scene;
}

#pragma mark -
#pragma mark Create CCMenu and CCMenuItem

-(void)setCCMenu {
  CGSize winSize = [CCDirector sharedDirector].winSize;
  
  //create information label for noticing user tap CCMenuItems
  //set "CCLabelTTF *infoLabel" in MenuLayer.h
  infoLabel = [CCLabelTTF labelWithString:@"(Tap an Item)" fontName:@"Helvetica" fontSize:24];
  infoLabel.position = ccp(winSize.width/2, 30);
  [self addChild:infoLabel];
  
  //create CCMenuItems for CCMenu:
  
  //create CCMenuItemImage
  CCMenuItem *itemImage = [CCMenuItemImage itemWithNormalImage:@"square.png" selectedImage:@"square_selected.png" block:^(id sender){
    infoLabel.string = @"(ItemImage Tapped)";
  }];
  
  //create CCMenuItemSprite
  CCMenuItem *itemSprite = [CCMenuItemSprite itemWithNormalSprite:[CCSprite spriteWithFile:@"square.png"] selectedSprite:[CCSprite spriteWithFile:@"square_selected.png"] block:^(id sender){
    infoLabel.string = @"(ItemSprite Tapped)";
  }];
  
  //create CCMenuItemFont
  CCMenuItem *itemFont = [CCMenuItemFont itemWithString:@"MenuItemFont" block:^(id sender){
    infoLabel.string = @"(ItemFont Tapped)";
  }];
  
  //create CCMenuItemLabel
  CCMenuItem *itemLabel = [CCMenuItemLabel itemWithLabel:[CCLabelTTF labelWithString:@"MenuItemLabel" fontName:@"Helvetica" fontSize:24] block:^(id block){
    infoLabel.string = @"(ItemLabel Tapped)";
  }];
  
  //create CCMenuItemToggle with CCMenuItemFonts
  CCMenuItem *itemToggle= [CCMenuItemToggle itemWithItems:[NSArray arrayWithObjects:[CCMenuItemFont itemWithString:@"ItemToggle1"],[CCMenuItemFont itemWithString:@"ItemToggle2"],[CCMenuItemFont itemWithString:@"ItemToggle3"], nil] block:^(id sender){
    infoLabel.string = @"(ItemToggle with CCMenuItemFont Tapped)";
  }];
  
  //create CCMenuItemToggle with CCMenuItemImages
  CCMenuItem *item1 = [CCMenuItemImage itemWithNormalImage:@"square.png" selectedImage:@"square_selected.png"];
  CCMenuItem *item2 = [CCMenuItemImage itemWithNormalImage:@"square_dark.png" selectedImage:@"square_selected.png"];
  CCMenuItem *itemToggle2 = [CCMenuItemToggle itemWithTarget:self selector:@selector(itemToggleWithItemImageTapped:) items:item1,item2, nil];
  
  //detect iPad or iPhone for scale
  if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    itemImage.scale = 0.3;
    itemSprite.scale = 0.3;
    itemToggle2.scale = 0.3;
  }
  
  //create CCMenu to contain CCMenuItems
  CCMenu *menu = [CCMenu menuWithItems:itemImage,itemSprite,itemFont,itemLabel,itemToggle,itemToggle2, nil];
  [menu alignItemsVertically];
  [self addChild:menu];
}

-(void)itemToggleWithItemImageTapped:(id)sender {
  infoLabel.string = @"(ItemToggle with CCMenuImage Tapped)";
}

#pragma mark -
#pragma mark Init

/*
Target: Set CCMenu to contain many types of  CCMenuItem, tap one of the items to trigger a specific function.

1. Create CCMenuItem, including
CCMenuItemImage,
CCMenuItemSprite,
CCMenuItemFont,
CCMenuItemLabel,
CCMenuItemToggle with CCMenuItemFont, CCMenuItemToggle with CCMenuItemImage

2. Create CCMenu to contain these CCMenuItem
*/

-(id)init {
	if( (self=[super init])) {
    [self setCCMenu];
	}
  
	return self;
}

-(void)dealloc {
	[super dealloc];
}

@end
