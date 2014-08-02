#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    //creates a character object (the actually flappy bird)
    //loads a new character from the CCB file
    //CCB files created by SpriteBuilder
    character = (Character*)[CCBReader load:@"Character"];
    //calling a method:
    //[objectName methodName:parameter]
    [physicsNode addChild:character];
    
    //adding a single obstacle
    [self addObstacle];
    //initializing the time since the last obstacle
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // this will be run every frame.
    // delta is the time that has elapsed since the last time it was run. This is usually 1/60, but can be bigger if the game slows down
    // put update code here
    // Increment the time since the last obstacle was added
    timeSinceObstacle += delta; // delta is approximately 1/60th of a second
    
    // Check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        // Add a new obstacle
        [self addObstacle];
        
        // Then reset the timer.
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
//declaring new methods:
//-(type I return)nameOfMethod: (type of first parameter) firstParameter continuationOfMethodName: (type of second parameter) secondParameter
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    // this will get called every time the player touches the screen
    [character flap];
}

@end
