    //
//  CollectionsController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "CollectionsController.h"


@implementation CollectionsController

@synthesize managedObjectContext, addingManagedObjectContext;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.title = NSLocalizedString(@"brands", nil);
      UIImage* image = [UIImage imageNamed:@"brand.png"];
      self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];  
    }
    return self;
}

-(id)initWithID:(NSNumber *)remote_collection_id{
  
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
  UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 411.0)];
  bgView.frame = CGRectMake(0.0, 0.0, 320.0, 411.0);
  bgView.userInteractionEnabled = YES;
  
  UIImageView *coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 420.0)];
  UIImage *coverImage = [UIImage imageNamed:@"cover.jpg"];
  coverImageView.frame = CGRectMake(0.0, 0.0, 320.0, 420.0);
  coverImageView.alpha = 1.000;
  coverImageView.autoresizesSubviews = YES;
  coverImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
  coverImageView.clearsContextBeforeDrawing = YES;
  coverImageView.clipsToBounds = NO;
  coverImageView.contentMode = UIViewContentModeScaleAspectFill;
  coverImageView.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
  coverImageView.hidden = NO;
  coverImageView.highlighted = NO;
  coverImageView.image = coverImage;
  coverImageView.multipleTouchEnabled = NO;
  coverImageView.opaque = YES;
  coverImageView.tag = 0;
  coverImageView.userInteractionEnabled = NO;
  
  [bgView addSubview:coverImageView];
  self.view  = bgView;
  [coverImageView release];
  [bgView release];
}


-(void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];   
  [self.navigationController setNavigationBarHidden:YES animated:NO];   
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
  
    // 按钮需要动态生成
  NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] managedObjectContext]; 
    //NSLog( @"context %@", context);
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Collection" 
                                            inManagedObjectContext:context];
  [request setEntity:entity];
  
  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"remote_collection_id" 
                                                                 ascending:NO]; 
  NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
  [request setSortDescriptors:sortDescriptors];
  [sortDescriptor release];
  [sortDescriptors release];

  
  NSError *error = nil;
  NSMutableArray *collections = [[context executeFetchRequest:request error:&error] mutableCopy];  
  [request release];  
  
  if (collections == nil) {
      // Handle the error.
      // NSLog(@"selectedBrandCollections: %@", collections);
  }else {
    // NSLog(@"selectedBrandCollections: %@", collections);
    // 按钮需要动态生成    
    Collection *element;
    
    UIButton *decButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    decButton.frame = CGRectMake(0, 284 - (-2*44)+20, 320, 44);
    decButton.frame = CGRectMake(0, 284 - (0*44)+20, 320, 150);    
//    [decButton setTitle:element.name forState:UIControlStateNormal];
    decButton.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    [self.view addSubview: decButton];    
    
    int j = -1;
    for (element in collections) {
      UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
      //setframe (where on screen)
      button.frame = CGRectMake(0, 284 - (j*44)+20, 320, 44);
      if (j==-1) {
        button.frame = CGRectMake(0, 284 - (j*44)+22, 320, 44);
      }
      [button setTitle:[@"     " stringByAppendingString:element.name] forState:UIControlStateNormal];
      button.titleLabel.font = [UIFont fontWithName:@"Verdana" size:18.000];
      button.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
      button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
      NSString *collectionUrl = [[NSString alloc] initWithFormat:@"tt://collection/%@", element.remote_collection_id];
      [button addTarget:collectionUrl action:@selector(openURLFromButton:) forControlEvents:UIControlEventTouchUpInside];

      UIButton *fackButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
      fackButton.frame = CGRectMake(255.0, 284 - (j*44)+26, 29.0, 31.0);
      if (j==-1) {
        fackButton.frame = CGRectMake(255.0, 284 - (j*44)+28, 29.0, 31.0);
      }      
      [fackButton addTarget:collectionUrl action:@selector(openURLFromButton:)forControlEvents:UIControlEventTouchUpInside];

      [self.view addSubview: button];
      [self.view addSubview: fackButton];
//      [collectionUrl release];
      j++;
    }

    UIButton *divButton = [UIButton buttonWithType:UIButtonTypeCustom];
    divButton.frame = CGRectMake(0, 284+44+20, 320, 2); 
    divButton.backgroundColor = [UIColor colorWithRed:227 green:219 blue:206 alpha:0.8];

    [self.view addSubview: divButton];
    UIImageView *decoration = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 209.0, 320.0, 128.0)];
    UIImage *decorationImage = [UIImage imageNamed:@"li_background.png"];
    decoration.frame = CGRectMake(0, 284-(j-1)*44-108, 320, 128);
    decoration.alpha = 1.000;
    decoration.autoresizesSubviews = YES;
    decoration.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    decoration.clearsContextBeforeDrawing = YES;
    decoration.clipsToBounds = NO;
    decoration.contentMode = UIViewContentModeScaleToFill;
    decoration.contentStretch = CGRectFromString(@"{{0, 0}, {1, 1}}");
    decoration.hidden = NO;
    decoration.highlighted = NO;
    decoration.image = decorationImage;
    decoration.multipleTouchEnabled = NO;
    decoration.opaque = YES;
    decoration.tag = 0;
    decoration.userInteractionEnabled = NO; 
    [self.view addSubview: decoration];
    [collections release];
    [decoration release];
//    [divButton release];
  }
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
