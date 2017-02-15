//
//  Player.m
//  SnakesAndLadders
//
//  Created by Dave Augerinos on 2017-02-14.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _currentSquare = 1;
        _name = name;
    }
    return self;
}


@end
