//
//  Player.h
//  SnakesAndLadders
//
//  Created by Dave Augerinos on 2017-02-14.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (assign, nonatomic) NSInteger currentSquare;
@property (strong, nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end
