//
//  EscenaMenu.m
//  PlantillaSpriteKit
//
//  Created by Berganza on 30/04/14.
//  Copyright (c) 2014 Berganza. All rights reserved.
//

#import "EscenaMenu.h"

@implementation EscenaMenu


- (void)didMoveToView: (SKView *) view
{
    if (!self.creacionDeEscena)
    {
        // Método propio
        [self crearContenidoDeEscena];
        self.creacionDeEscena = YES;

    }
}

// Selector de método propio para incorporar a la escena el contenido
- (void)crearContenidoDeEscena {
    
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild:self.pantallaMenu];
    [self addChild:self.opciones];
    [self addChild:self.juego];
    [self addChild:self.ajustes];
    [self addChild:self.personalizada];

}


- (SKLabelNode *)pantallaMenu {
    SKLabelNode *pantallaMenu = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
    pantallaMenu.text = @"Titulo Juego";
    pantallaMenu.fontSize = 30;
    pantallaMenu.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 1/3 - 40);
    return pantallaMenu;
}

- (SKLabelNode *)opciones {
    SKLabelNode *opciones = [SKLabelNode labelNodeWithFontNamed:@"Futura-Medium"];
    opciones.text = @"Menu Principal";
    opciones.fontSize = 24;
    opciones.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame) * 10/6);
    
    return opciones;
}

- (SKLabelNode *)juego {
    SKLabelNode *juego = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    juego.text = @"- Jugar";
    juego.fontSize = 20;
    juego.position = CGPointMake(CGRectGetMinX(self.frame)+50,CGRectGetMidY(self.frame) * 8/6);
    juego.name=@"juego";
    return juego;
}


- (SKLabelNode *)ajustes {
    SKLabelNode *ajustes = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    ajustes.text = @"- Ajustes";
    ajustes.fontSize = 20;
    ajustes.position = CGPointMake(CGRectGetMinX(self.frame)+57,CGRectGetMidY(self.frame) * 6/6);
    ajustes.name = @"ajustes";
    return ajustes;
}

- (SKLabelNode *)personalizada {
    SKLabelNode *personalizada = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
    personalizada.text = @"- Escena Personalizada";
    personalizada.fontSize = 20;
    personalizada.position = CGPointMake(CGRectGetMinX(self.frame)+120,CGRectGetMidY(self.frame) * 4/6);
    personalizada.name = @"personalizada";
    return personalizada;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    ;
    
    
    if ([node.name isEqualToString:@"juego"]) {
        
        SKTransition *reveal = [SKTransition doorsOpenVerticalWithDuration:2];
        EscenaJuego * escena1 = [EscenaJuego sceneWithSize:self.frame.size];
        [self.view presentScene:escena1 transition: reveal];

    }
    
    if ([node.name isEqualToString:@"ajustes"]) {
        
        SKTransition *reveal = [SKTransition doorsOpenVerticalWithDuration:2];
        EscenaAjustes * escena2 = [EscenaAjustes sceneWithSize:self.frame.size];
        [self.view presentScene:escena2 transition: reveal];
        
    }
    
    if ([node.name isEqualToString:@"personalizada"]) {
        
        SKTransition *reveal = [SKTransition doorsOpenVerticalWithDuration:2];
        EscenaPersonalizada * escena3 = [EscenaPersonalizada sceneWithSize:self.frame.size];
        [self.view presentScene:escena3 transition: reveal];
        
    }
    
}


@end
