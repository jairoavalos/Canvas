//
//  CanvasViewController.m
//  Canvas
//
//  Created by Jairo Avalos on 6/26/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "CanvasViewController.h"

@interface CanvasViewController ()

@end

@implementation CanvasViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Set up the tray ------------------
    int trayHeight = 80;
    UIView *trayView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - trayHeight, self.view.frame.size.width, trayHeight)];
    trayView.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:233.0/255.0 blue:253.0/255.0 alpha:1];
    
    // add elements to the tray
    UIImageView *usSoccer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"us-crest"]];
    usSoccer.userInteractionEnabled = YES;
    [trayView addSubview:usSoccer];
    
    UIImageView *germanSoccer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"germany-crest"]];
    germanSoccer.userInteractionEnabled = YES;
    [trayView addSubview:germanSoccer];
    
    [self.view addSubview:trayView];
    // Done setting up Tray -------------
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
