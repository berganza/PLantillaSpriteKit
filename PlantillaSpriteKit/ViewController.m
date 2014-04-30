//
//  ViewController.m
//  PlantillaSpriteKit
//
//  Created by Berganza on 30/04/14.
//  Copyright (c) 2014 Berganza. All rights reserved.
//

#import "ViewController.h"
#import "EscenaMenu.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    EscenaMenu * escena = [EscenaMenu sceneWithSize:skView.bounds.size];
    escena.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:escena];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
