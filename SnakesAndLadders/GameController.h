//
//  GameController.h
//  SnakesAndLadders
//
//  Created by Dave Augerinos on 2017-02-14.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameController : NSObject

@property (assign, nonatomic) BOOL gameOver;

-(NSString *)rollDice;

@end
