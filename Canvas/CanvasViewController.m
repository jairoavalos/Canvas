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
    
    // Set up the tray -------------------------------------------------------------------
    int trayHeight = 80;
    UIView *trayView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - trayHeight, self.view.frame.size.width, trayHeight)];
    trayView.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:233.0/255.0 blue:253.0/255.0 alpha:1];
    // Create and initialize a tap gesture
    UIPanGestureRecognizer *trayDragRecognizer = [[UIPanGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(trayDragged:)];
    // Add the tap gesture recognizer to the image
    [trayView addGestureRecognizer:trayDragRecognizer];
  
  
  
  
    // add all elements to the tray
    UIImageView *usSoccer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"us-crest"]];
    usSoccer.frame = CGRectMake(21, 17, usSoccer.image.size.width, usSoccer.image.size.height);
    usSoccer.userInteractionEnabled = YES;
    // Create and initialize a tap gesture
    UIPanGestureRecognizer *usDragRecognizer = [[UIPanGestureRecognizer alloc]
                                           initWithTarget:self action:@selector(usDragged:)];
    // Add the tap gesture recognizer to the image
    [usSoccer addGestureRecognizer:usDragRecognizer];
    [trayView addSubview:usSoccer];
  
  
    
    UIImageView *germanSoccer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"germany-crest"]];
    germanSoccer.frame = CGRectMake(92, 8, germanSoccer.image.size.width, germanSoccer.image.size.height);
    germanSoccer.userInteractionEnabled = YES;
    [trayView addSubview:germanSoccer];
    // Create and initialize a tap gesture
    UIPanGestureRecognizer *germanDragRecognizer = [[UIPanGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(germanyDragged:)];
    // Add the tap gesture recognizer to the image
    [germanSoccer addGestureRecognizer:germanDragRecognizer];
    [trayView addSubview:germanSoccer];
  
  
  
    UIImageView *portugalSoccer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"portugal-crest"]];
    portugalSoccer.frame = CGRectMake(182, 14, portugalSoccer.image.size.width, portugalSoccer.image.size.height);
    portugalSoccer.userInteractionEnabled = YES;
    [trayView addSubview:portugalSoccer];
    // Create and initialize a tap gesture
    UIPanGestureRecognizer *portugalDragRecognizer = [[UIPanGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(portugalDragged:)];
    // Add the tap gesture recognizer to the image
    [portugalSoccer addGestureRecognizer:portugalDragRecognizer];
    [trayView addSubview:portugalSoccer];
  
  
  
    UIImageView *ghanaSoccer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ghana-crest"]];
    ghanaSoccer.frame = CGRectMake(260, 12, ghanaSoccer.image.size.width, ghanaSoccer.image.size.height);
    ghanaSoccer.userInteractionEnabled = YES;
    [trayView addSubview:ghanaSoccer];
    // Create and initialize a tap gesture
    UIPanGestureRecognizer *ghanaDragRecognizer = [[UIPanGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(ghanaDragged:)];
    // Add the tap gesture recognizer to the image
    [ghanaSoccer addGestureRecognizer:ghanaDragRecognizer];
    [trayView addSubview:ghanaSoccer];
  
  
    // Add tray to the main view
    [self.view addSubview:trayView];
    // Done setting up Tray -------------------------------------------------------
}


- (IBAction)trayDragged:(UIPanGestureRecognizer *)sender {
  NSLog(@"Tray dragged");
}

- (IBAction)usDragged:(UIPanGestureRecognizer *)sender {
  NSLog(@"US dragged");
  
  if (sender.state == UIGestureRecognizerStateBegan) {
    //show the image right next to your touch point
  } else if (sender.state == UIGestureRecognizerStateChanged) {
    //take into view if outside of the tray
    // else disappear
  }
}

- (IBAction)germanyDragged:(UIPanGestureRecognizer *)sender {
  NSLog(@"Germany dragged");
}

- (IBAction)portugalDragged:(UIPanGestureRecognizer *)sender {
  NSLog(@"Portugal dragged");
}

- (IBAction)ghanaDragged:(UIPanGestureRecognizer *)sender {
  NSLog(@"Ghana dragged");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
