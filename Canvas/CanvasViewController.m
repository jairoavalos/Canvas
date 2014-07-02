//
//  CanvasViewController.m
//  Canvas
//
//  Created by Jairo Avalos on 6/26/14.
//  Copyright (c) 2014 Jairo Avalos. All rights reserved.
//

#import "CanvasViewController.h"

@interface CanvasViewController ()

@property UIView *trayView;
@property float originalHeadlineY;
@property float rotation;
@property float imageSize;

@property (nonatomic, strong) UIImageView * createdImageView;


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
    self.trayView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - trayHeight, self.view.frame.size.width, trayHeight)];
    self.trayView.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:233.0/255.0 blue:253.0/255.0 alpha:1];
    // Create and initialize a tap gesture
    UIPanGestureRecognizer *trayDragRecognizer = [[UIPanGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(trayDragged:)];
    // Add the tap gesture recognizer to the image
    [self.trayView addGestureRecognizer:trayDragRecognizer];
  
  
  
  
    // add all elements to the tray
    UIImageView *usSoccer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"us-crest"]];
    usSoccer.frame = CGRectMake(21, 17, usSoccer.image.size.width, usSoccer.image.size.height);
    usSoccer.userInteractionEnabled = YES;
    // Create and initialize a tap gesture
    UIPanGestureRecognizer *usDragRecognizer = [[UIPanGestureRecognizer alloc]
                                           initWithTarget:self action:@selector(usDragged:)];
    // Add the tap gesture recognizer to the image
    [usSoccer addGestureRecognizer:usDragRecognizer];
    [self.trayView addSubview:usSoccer];
  
  
    
    UIImageView *germanSoccer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"germany-crest"]];
    germanSoccer.frame = CGRectMake(92, 8, germanSoccer.image.size.width, germanSoccer.image.size.height);
    germanSoccer.userInteractionEnabled = YES;
    [self.trayView addSubview:germanSoccer];
    // Create and initialize a tap gesture
    UIPanGestureRecognizer *germanDragRecognizer = [[UIPanGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(germanyDragged:)];
    // Add the tap gesture recognizer to the image
    [germanSoccer addGestureRecognizer:germanDragRecognizer];
    [self.trayView addSubview:germanSoccer];
  
  
  
    UIImageView *portugalSoccer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"portugal-crest"]];
    portugalSoccer.frame = CGRectMake(182, 14, portugalSoccer.image.size.width, portugalSoccer.image.size.height);
    portugalSoccer.userInteractionEnabled = YES;
    [self.trayView addSubview:portugalSoccer];
    // Create and initialize a tap gesture
    UIPanGestureRecognizer *portugalDragRecognizer = [[UIPanGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(portugalDragged:)];
    // Add the tap gesture recognizer to the image
    [portugalSoccer addGestureRecognizer:portugalDragRecognizer];
    [self.trayView addSubview:portugalSoccer];
  
  
  
    UIImageView *ghanaSoccer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ghana-crest"]];
    ghanaSoccer.frame = CGRectMake(260, 12, ghanaSoccer.image.size.width, ghanaSoccer.image.size.height);
    ghanaSoccer.userInteractionEnabled = YES;
    [self.trayView addSubview:ghanaSoccer];
    // Create and initialize a tap gesture
    UIPanGestureRecognizer *ghanaDragRecognizer = [[UIPanGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(ghanaDragged:)];
    // Add the tap gesture recognizer to the image
    [ghanaSoccer addGestureRecognizer:ghanaDragRecognizer];
    [self.trayView addSubview:ghanaSoccer];
  
  
    // Add tray to the main view
    [self.view addSubview:self.trayView];
    // Done setting up Tray -------------------------------------------------------
}


- (IBAction)trayDragged:(UIPanGestureRecognizer *)sender {
    
    // Drag offset in view
    CGPoint offset = [sender translationInView:self.view];
    
    // threshold for showing/revealing tray
    int trayThreshold = 520;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        //do nothing
        self.originalHeadlineY = self.trayView.center.y;

    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        // Do not allow drag past original position when tray is revealed
        if ([sender locationInView:self.view].y > self.view.frame.size.height - self.trayView.frame.size.height) {
            self.trayView.center = CGPointMake(self.view.frame.size.width/2, self.originalHeadlineY + offset.y);
        }
        
        // If the top of the tray passes the threshold, then hide the tray
        int trayOriginY = self.trayView.frame.origin.y;
        if (trayOriginY > trayThreshold) {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.trayView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height + self.trayView.frame.size.height/6);
            } completion:^(BOOL finished) {
                // nothing if no completion
            }];
        } else {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.trayView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height - self.trayView.frame.size.height/2);
            } completion:^(BOOL finished) {
                // nothing if no completion
            }];
        }
    }
}

- (BOOL)trayRevealed {
    if (self.trayView.frame.origin.y == self.view.frame.size.height - self.trayView.frame.size.height) return true;
    return false;
}

- (IBAction)usDragged:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];
    UIImage *usCrest;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        // Show and create image copy
        usCrest = [UIImage imageNamed:@"us-crest"];
        self.createdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(touchPosition.x, touchPosition.y, usCrest.size.width * 2, usCrest.size.height * 2)];
        [self.createdImageView setImage:usCrest];
        [self.view addSubview:self.createdImageView];
        
        // Add gesture recognizer to image view
        [self.createdImageView setUserInteractionEnabled:YES];
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panningImage:)];
        [self.createdImageView addGestureRecognizer:panGestureRecognizer];
        
        UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchingImage:)];
        [self.createdImageView addGestureRecognizer:pinchGestureRecognizer];
        
        UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotatingImage:)];
        [self.createdImageView addGestureRecognizer:rotationGestureRecognizer];
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        // Move image around
        self.createdImageView.center = [sender locationInView:self.view];
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        // Bring tray to the front
        [self.view bringSubviewToFront:self.trayView];
    }
}

- (IBAction)germanyDragged:(UIPanGestureRecognizer *)sender {
    
    CGPoint touchPosition = [sender locationInView:self.view];
    UIImage *germanyCrest;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        // Show and create image copy
        germanyCrest = [UIImage imageNamed:@"germany-crest"];
        self.createdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(touchPosition.x, touchPosition.y, germanyCrest.size.width * 2, germanyCrest.size.height * 2)];
        [self.createdImageView setImage:germanyCrest];
        [self.view addSubview:self.createdImageView];
        
        // Add gesture recognizer to image view
        [self.createdImageView setUserInteractionEnabled:YES];
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panningImage:)];
        [self.createdImageView addGestureRecognizer:panGestureRecognizer];
        
        UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchingImage:)];
        [self.createdImageView addGestureRecognizer:pinchGestureRecognizer];
        
        UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotatingImage:)];
        [self.createdImageView addGestureRecognizer:rotationGestureRecognizer];
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        // Move image around
        self.createdImageView.center = [sender locationInView:self.view];
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        // Bring tray to the front
        [self.view bringSubviewToFront:self.trayView];
    }
    
}

- (IBAction)portugalDragged:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];
    UIImage *portugalCrest;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        // Show and create image copy
        portugalCrest = [UIImage imageNamed:@"portugal-crest"];
        self.createdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(touchPosition.x, touchPosition.y, portugalCrest.size.width * 2, portugalCrest.size.height * 2)];
        [self.createdImageView setImage:portugalCrest];
        [self.view addSubview:self.createdImageView];
        
        // Add gesture recognizer to image view
        [self.createdImageView setUserInteractionEnabled:YES];
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panningImage:)];
        [self.createdImageView addGestureRecognizer:panGestureRecognizer];
        
        UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchingImage:)];
        [self.createdImageView addGestureRecognizer:pinchGestureRecognizer];
        
        UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotatingImage:)];
        [self.createdImageView addGestureRecognizer:rotationGestureRecognizer];
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        // Move image around
        self.createdImageView.center = [sender locationInView:self.view];
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        // Bring tray to the front
        [self.view bringSubviewToFront:self.trayView];
    }
}

- (IBAction)ghanaDragged:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];
    UIImage *ghanaCrest;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        // Show and create image copy
        ghanaCrest = [UIImage imageNamed:@"ghana-crest"];
        self.createdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(touchPosition.x, touchPosition.y, ghanaCrest.size.width * 2, ghanaCrest.size.height * 2)];
        [self.createdImageView setImage:ghanaCrest];
        [self.view addSubview:self.createdImageView];
        
        // Add gesture recognizer to image view
        [self.createdImageView setUserInteractionEnabled:YES];
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panningImage:)];
        [self.createdImageView addGestureRecognizer:panGestureRecognizer];
        
        UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchingImage:)];
        [self.createdImageView addGestureRecognizer:pinchGestureRecognizer];
        
        UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotatingImage:)];
        [self.createdImageView addGestureRecognizer:rotationGestureRecognizer];
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        // Move image around
        self.createdImageView.center = [sender locationInView:self.view];
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        // Bring tray to the front
        [self.view bringSubviewToFront:self.trayView];
    }}

- (IBAction)panningImage:(UIPanGestureRecognizer *)sender {
    sender.view.center = [sender locationInView:self.view];
}

- (IBAction)pinchingImage:(UIPinchGestureRecognizer *)sender {
    sender.view.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
    self.imageSize = sender.scale;
    if(sender.state == UIGestureRecognizerStateChanged) {
        CGAffineTransform transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
        transform = CGAffineTransformRotate(transform,self.rotation);
        sender.view.transform = transform;
    }
}

- (IBAction)rotatingImage:(UIRotationGestureRecognizer *)sender {
    self.rotation = sender.rotation;
    if(sender.state == UIGestureRecognizerStateChanged) {
        CGAffineTransform transform = CGAffineTransformMakeRotation(sender.rotation);
        transform = CGAffineTransformScale(transform, self.imageSize, self.imageSize);
        sender.view.transform = transform;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
