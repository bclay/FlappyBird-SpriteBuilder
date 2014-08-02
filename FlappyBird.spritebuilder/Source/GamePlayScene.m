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
}

-(void)update:(CCTime)delta
{
    // put update code here
}

// put new methods here
//declaring new methods:
//-(type I return)nameOfMethod: (type of first parameter) firstParameter continuationOfMethodName: (type of second parameter) secondParameter
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    // this will get called every time the player touches the screen
    [character flap];
}

@end
