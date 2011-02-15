//
//  VideosController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "VideosController.h"
#import <MediaPlayer/MPMoviePlayerController.h>
#import <MediaPlayer/MPMoviePlayerViewController.h>

@implementation VideosController

@synthesize managedObjectContext, addingManagedObjectContext;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//      self.title = @"Video";
      self.title = NSLocalizedString(@"videos", nil);
      UIImage* image = [UIImage imageNamed:@"video.png"];      
      self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

-(void)viewDidLoad{
  NSString* s = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"mp4"];
  NSLog(@"s: %@", s);
  NSURL* videoURL = [NSURL fileURLWithPath:s];
  MPMoviePlayerViewController* theMoviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(moviePlayerDidExitFullscreen:)
                                               name:MPMoviePlayerPlaybackDidFinishNotification
                                             object:nil];
//  theMoviePlayer.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc]  
//                                                      initWithTitle:NSLocalizedString(@"back", nil)
//                                                              style:UIBarButtonItemStyleDone 
//                                                             target:self 
//                                                      action:@selector(backHome)] autorelease];
  [self presentMoviePlayerViewControllerAnimated:theMoviePlayer];
}

- (void)moviePlayerDidExitFullscreen:(NSNotification *)theNotification {
  [self dismissModalViewControllerAnimated:YES];
//  self.tabBarController.selectedIndex = 0;
//  [self.tabBarController.selectedViewController viewDidAppear:YES];
//  TTOpenURL([NSString stringWithFormat:@"tt://tabBar/1", self.view]);
  UIImageView *preview = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 95.0, 320.0, 182.0)]; 
  UIImage *previewImage = [UIImage imageNamed:@"preview.png"];
  preview.image = previewImage;
  
  UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];  
  playButton.frame = CGRectMake(124, 150, 73, 73);  
  playButton.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
  UIImage *playArrowImage = [UIImage imageNamed:@"play_arrow.png"];
  [playButton setBackgroundImage:playArrowImage forState:UIControlStateNormal];
  [playButton addTarget:self action:@selector(replayVideo) forControlEvents:UIControlEventTouchUpInside];  
  
  [self.view addSubview:preview];
  [self.view addSubview:playButton];
  [preview release];  
  NSLog(@"exit player");  
}

-(void)replayVideo{
  NSString* s = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"mp4"];
  NSLog(@"s: %@", s);
  NSURL* videoURL = [NSURL fileURLWithPath:s];
  MPMoviePlayerViewController* theMoviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(moviePlayerDidExitFullscreen:)
                                               name:MPMoviePlayerPlaybackDidFinishNotification
                                             object:nil];
  [self presentMoviePlayerViewControllerAnimated:theMoviePlayer];  
}

-(void)backHome{
  self.tabBarController.selectedIndex = 0;
  [self.tabBarController.selectedViewController viewDidAppear:YES];  
  //  TTOpenURL([NSString stringWithFormat:@"tt://tabBar/1", self.view]);
  NSLog(@"backHome");  
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad1 {
    [super viewDidLoad];
  NSLog(@"video view");
  [self video_play:@"demo"];
}

- (void)playMovieAtURL:(NSURL*)theURL{
  MPMoviePlayerController* theMovie= [[MPMoviePlayerController alloc] initWithContentURL:theURL];
  theMovie.view.frame = CGRectMake(0, 0, 480, 320);  
//  theMovie.controlStyle = MPMovieControlStyleFullscreen;
  theMovie.controlStyle = MPMovieControlStyleEmbedded;
//  theMovie.controlStyle = MPMovieControlStyleNone;

//  theMovie.scalingMode = MPMovieScalingModeNone;
  theMovie.scalingMode = MPMovieScalingModeAspectFit;
//  theMovie.scalingMode = MPMovieScalingModeAspectFill;
//  theMovie.scalingMode = MPMovieScalingModeFill;
  //    theMovie.userCanShowTransportControls=NO;
  
  //[theMovie setOrientation:UIDeviceOrientationLandscapeLeft animated:NO];   
  
  // Register for the playback finished notification.
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(myMovieFinishedCallback:)
                                               name:MPMoviePlayerPlaybackDidFinishNotification
                                             object:theMovie];
  self.view = theMovie.view;
  // Movie playback is asynchronous, so this method returns immediately.
  theMovie.fullscreen = YES;
  [theMovie play];
  [theMovie release];
}

// When the movie is done,release the controller.
- (void)myMovieFinishedCallback:(NSNotification*)aNotification{
  MPMoviePlayerController* theMovie=[aNotification object];
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:MPMoviePlayerPlaybackDidFinishNotification
                                                object:theMovie];
  
  // Release the movie instance created in playMovieAtURL
  [theMovie release];
} 

- (void)video_play:(NSString*)filename{
  NSLog(@"filename: %@", filename);  
  NSString* s = [[NSBundle mainBundle] pathForResource:filename ofType:@"mp4"];
  NSLog(@"s: %@", s);   
  NSURL* url = [NSURL fileURLWithPath:s];
  NSLog(@"Playing URL: %@", url);
  [self playMovieAtURL:url];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//  return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
//  return YES;
//return UIInterfaceOrientationIsLandscape(interfaceOrientation);
  return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);  
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
  [managedObjectContext release];
  [addingManagedObjectContext release];    
    [super dealloc];
}


@end
