//
//  GameController.m
//  SnakesAndLadders
//
//  Created by Dave Augerinos on 2017-02-14.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "GameController.h"
#import "Player.h"

@implementation GameController
{
    NSDictionary *board;
    Player *activePlayer;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        // Initialize the game board with 'snakes' and 'ladder' relationships
        board = [[NSDictionary alloc] initWithObjectsAndKeys: @4, @14, @9, @31, @17, @7, @20, @38, @28, @84, @40, @59, @51, @67, @63, @81, @64, @60, @89, @26, @95, @75, @99, @78, nil];
        activePlayer = [[Player alloc] initWithName:@"Player 1"];
        _gameOver = NO;
    }
    return self;
}

- (NSString *)rollDice {
    
    // Roll 6 sided die to random value
    int dieValue = arc4random_uniform(5) + 1;
    
    NSLog(@"You rolled a %i", dieValue);
    
    // Get active players current position
    NSInteger pastSquare = activePlayer.currentSquare;
    
    // Increase active player's current square by die value
    activePlayer.currentSquare += dieValue;
    
    // Check if active player has won
    if(activePlayer.currentSquare >= 100) {
        self.gameOver = YES;
        return [NSString stringWithFormat:@"%@ has landed on square 100 and wins!!!", activePlayer.name];
    }
    
    // Check if active player has landed on a snake or ladder and adjust current square
    else {
        
        // Check if active player current square is a key in board game dictionary
        NSNumber *key = [NSNumber numberWithInteger: activePlayer.currentSquare];
        
        // If key is in board dictionary get the associated object and convert to NSInteger
        if([board objectForKey:key]) {
            NSNumber *boardSquare = [board objectForKey:[NSNumber numberWithInteger:activePlayer.currentSquare]];
            NSInteger specialSquare = [boardSquare integerValue];
            
            // Check if active player current square is a snake or a ladder
            if(activePlayer.currentSquare < specialSquare) {
                // Move current player to special square
                activePlayer.currentSquare = specialSquare;
                return [NSString stringWithFormat:@"%@ has landed on a ladder!  Moving from square %lu to square %lu", activePlayer.name, pastSquare, specialSquare];
            }
            
            else {
                // Move current player to special square
                activePlayer.currentSquare = specialSquare;
                return [NSString stringWithFormat:@"%@ has landed on a snake! Moving from square %lu to square %lu", activePlayer.name, pastSquare, specialSquare];
            }
        }
    }
    
    // Otherwise player advances to regular square
    return [NSString stringWithFormat:@"%@ moving from square %lu to square %lu", activePlayer.name, pastSquare, activePlayer.currentSquare];
}

@end
