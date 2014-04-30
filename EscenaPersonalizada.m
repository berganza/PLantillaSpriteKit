//
//  EscenaPersonalizada.m
//  PlantillaSpriteKit
//
//  Created by Berganza on 30/04/14.
//  Copyright (c) 2014 Berganza. All rights reserved.
//

#import "EscenaPersonalizada.h"

@implementation EscenaPersonalizada

    AVAudioPlayer * reproductor;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        //self.backgroundColor = [SKColor cyanColor];
        self.scaleMode = SKSceneScaleModeAspectFit;
        [self addChild:self.volver];
        
        
        
        SKAction * sonido = [SKAction playSoundFileNamed:@"EfectoPuerta.wav" waitForCompletion:YES];
        [self runAction:sonido];
        
        [self startReproductor];
        
        SKSpriteNode *imagen = [SKSpriteNode spriteNodeWithImageNamed:@"camara.png"];
        imagen.position = CGPointMake (CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        imagen.xScale = 1;
        imagen.yScale = 1;
        imagen.zPosition = 1;
        [self addChild: imagen];
        
        
    }
    return self;
}




-(void) startReproductor {
    
    NSURL * rutaMusica = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"funeral" ofType:@"wav"]];
    reproductor = [[AVAudioPlayer alloc] initWithContentsOfURL:rutaMusica error:nil];
    
    [reproductor prepareToPlay];
    
    reproductor.numberOfLoops = 3;
    //[_backgroundAudioPlayer setVolume:1.0];
    [reproductor play];
}


-(void) stopReproductor {
    
    [reproductor stop];
    
}




- (SKLabelNode *)volver {
    SKLabelNode *volver = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
    volver.text = @"volver";
    volver.fontSize = 24;
    volver.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    volver.name = @"volver";
    volver.zPosition = 2;
    return volver;
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"volver"]) {
        
        
        SKTransition *reveal = [SKTransition doorsCloseVerticalWithDuration:2];
        EscenaMenu * escena = [EscenaMenu sceneWithSize:self.frame.size];
        [self.view presentScene:escena transition: reveal];
        
        [self stopReproductor];
        
        SKAction * sonido = [SKAction playSoundFileNamed:@"EfectoPuerta.wav" waitForCompletion:YES];
        [self runAction:sonido];
    }
}

@end
