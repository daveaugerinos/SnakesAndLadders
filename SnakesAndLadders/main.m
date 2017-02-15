//
//  main.m
//  SnakesAndLadders
//
//  Created by Dave Augerinos on 2017-02-14.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Boolean to control loop
        BOOL gameLoop = YES;
        
        // Initialize variables
        GameController *currentGame = [[GameController alloc] init];
        
        // Print greeting and request
        NSLog(@"Welcome to Snakes & Ladders!\n");
        
        // Start operations loop
        while (gameLoop) {
            
            // Ask player if they would like to play a game
            NSLog(@"Type 'roll' or 'r' to play\nType quit to exit:\n");

            // Read player answer
            NSString *inputString = [InputCollector readPlayerInput];
            
            // Check is using wants to quit playing
            if ([inputString isEqualToString:@"quit"]){
                printf("Thanks for playing Snakes & Ladders!\n");
                gameLoop = NO;
            }
            
            // Otherwise check answer
            else if([inputString isEqualToString:@"roll"] || [inputString isEqualToString:@"r"] ) {
                // Roll dice and output result
                NSString *result = [currentGame rollDice];
                NSLog(@"%@\n", result);
                
                if(currentGame.gameOver) {
                    NSLog(@"Game Over!\n");
                    // Reset for new game
                    currentGame = [[GameController alloc] init];
                }
            }
            
            else {
                NSLog(@"Invalid input.\n");
            }
            
            // continue in while loop
            continue;
        }
    }
    return 0;
}
