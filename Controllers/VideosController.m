    //
//  VideosController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "VideosController.h"
#import <MediaPlayer/MPMoviePlayerController.h>


@implementation VideosController

@synthesize managedObjectContext, addingManagedObjectContext;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.title = @"Video";
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
  NSLog(@"video view");
  [self video_play:@"demo"];
}

- (void)playMovieAtURL:(NSURL*)theURL{
  MPMoviePlayerController* theMovie= [[MPMoviePlayerController alloc] initWithContentURL:theURL];
  theMovie.controlStyle = MPMovieControlStyleFullscreen;
  theMovie.scalingMode=MPMovieScalingModeAspectFill;
  //    theMovie.userCanShowTransportControls=NO;
  
  // Register for the playback finished notification.
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(myMovieFinishedCallback:)
                                               name:MPMoviePlayerPlaybackDidFinishNotification
                                             object:theMovie];
  self.view = theMovie.view;
  // Movie playback is asynchronous, so this method returns immediately.
  [theMovie play];
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



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
