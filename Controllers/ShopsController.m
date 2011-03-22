    //
//  ShopsController.m
//  theCarnaby
//
//  Created by Johnson Qu on 10-12-17.
//  Copyright 2010 Koocaa Interactive. All rights reserved.
//

#import "ShopsController.h"


@implementation ShopsController

@synthesize managedObjectContext, addingManagedObjectContext;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      //self.title = @"Shops";
      self.title = NSLocalizedString(@"shops", nil);      
      UIImage* image = [UIImage imageNamed:@"shop.png"];
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
//  NSLog(@"%@",[NSBundle localizations]);
//  NSArray *locl = [NSBundle localizations];
//  NSArray *prelocl = [NSBundle preferredLocalizations];
//  NSUserDefaults* defs = [NSUserDefaults standardUserDefaults]; 
//  NSArray* languages = [defs objectForKey:@"AppleLanguages"]; 
//  NSString* preferredLang = [languages objectAtIndex:0];
  NSString *locale = [[NSLocale currentLocale] localeIdentifier];
  NSString *current_lang = [[NSLocale preferredLanguages] objectAtIndex:0];
  NSLog(@"current locale: %@", locale);
  NSLog(@"current lang: %@", current_lang);
  
  [super viewDidLoad];  
  NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] managedObjectContext]; 
  NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Shop" 
                                            inManagedObjectContext:context];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:
                            @"(province = %@)", @"北京"];
  [fetchRequest setPredicate:predicate];
  [fetchRequest setEntity:entity];
  NSError *error;
  NSArray *fetchedBejing = [context executeFetchRequest:fetchRequest error:&error];
  Shop *shop;
  NSMutableArray  *shopsBejing = [[NSMutableArray alloc]init];
  for (shop in fetchedBejing) {
    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
      [shopsBejing addObject:[TTTableTextItem itemWithText:shop.name URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];
    } else {
      [shopsBejing addObject:[TTTableTextItem itemWithText:shop.name_en URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];      
    }
  }
  // NSLog(@"shopsBejing %@",shopsBejing);
  NSPredicate *predicateShanghai = [NSPredicate predicateWithFormat:@"(province = %@)", @"上海"];
  [fetchRequest setPredicate:predicateShanghai];
  [fetchRequest setEntity:entity];
  NSArray *fetchedShanghai = [context executeFetchRequest:fetchRequest error:&error];
  NSMutableArray  *shopsShanghai = [[NSMutableArray alloc]init];
  for (shop in fetchedShanghai) {
    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
      [shopsShanghai addObject:[TTTableTextItem itemWithText:shop.name URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];
    } else {
      [shopsShanghai addObject:[TTTableTextItem itemWithText:shop.name_en URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];      
    }
  }
  // NSLog(@"shopsShanghai %@",shopsShanghai);
//  NSPredicate *predicateShandong = [NSPredicate predicateWithFormat:@"(province = %@)", @"山东"];
//  [fetchRequest setPredicate:predicateShandong];
//  [fetchRequest setEntity:entity];
//  NSArray *fetchedShandong = [context executeFetchRequest:fetchRequest error:&error];
//  NSMutableArray  *shopsShandong = [[NSMutableArray alloc]init];
//  for (shop in fetchedShandong) {
//    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
//      [shopsShandong addObject:[TTTableTextItem itemWithText:shop.name URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];
//    } else {
//      [shopsShandong addObject:[TTTableTextItem itemWithText:shop.name_en URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];      
//    }
//  }
//  // NSLog(@"shopsShandong %@",shopsShandong);
  NSPredicate *predicateJiangsu = [NSPredicate predicateWithFormat:@"(province = %@)", @"江苏"];
  [fetchRequest setPredicate:predicateJiangsu];
  [fetchRequest setEntity:entity];
  NSArray *fetchedJiangsu = [context executeFetchRequest:fetchRequest error:&error];
  NSMutableArray  *shopsJiangsu = [[NSMutableArray alloc]init];
  for (shop in fetchedJiangsu) {
    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
      [shopsJiangsu addObject:[TTTableTextItem itemWithText:shop.name URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];
    } else {
      [shopsJiangsu addObject:[TTTableTextItem itemWithText:shop.name_en URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];      
    }
  }
  // NSLog(@"shopsJiangsu %@",shopsJiangsu);
  NSPredicate *predicateZejiang = [NSPredicate predicateWithFormat:@"(province = %@)", @"浙江"];
  [fetchRequest setPredicate:predicateZejiang];
  [fetchRequest setEntity:entity];
  NSArray *fetchedZejiang = [context executeFetchRequest:fetchRequest error:&error];
  NSMutableArray  *shopsZejiang = [[NSMutableArray alloc]init];
  for (shop in fetchedZejiang) {
    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
      [shopsZejiang addObject:[TTTableTextItem itemWithText:shop.name URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];
    } else {
      [shopsZejiang addObject:[TTTableTextItem itemWithText:shop.name_en URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];      
    }
  }
  // NSLog(@"shopsZejiang %@",shopsZejiang);
  NSPredicate *predicateFujian = [NSPredicate predicateWithFormat:@"(province = %@)", @"福建"];
  [fetchRequest setPredicate:predicateFujian];
  [fetchRequest setEntity:entity];
  NSArray *fetchedFujian = [context executeFetchRequest:fetchRequest error:&error];
  NSMutableArray  *shopsFujian = [[NSMutableArray alloc]init];
  for (shop in fetchedFujian) {
    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
      [shopsFujian addObject:[TTTableTextItem itemWithText:shop.name URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];
    } else {
      [shopsFujian addObject:[TTTableTextItem itemWithText:shop.name_en URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];      
    }
  }
  // NSLog(@"shopsFujian %@",shopsFujian);
//  NSPredicate *predicateLiaoning = [NSPredicate predicateWithFormat:@"(province = %@)", @"辽宁"];
//  [fetchRequest setPredicate:predicateLiaoning];
//  [fetchRequest setEntity:entity];
//  NSArray *fetchedLiaoning = [context executeFetchRequest:fetchRequest error:&error];
//  NSMutableArray  *shopsLiaoning = [[NSMutableArray alloc]init];
//  for (shop in fetchedLiaoning) {
//    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
//      [shopsLiaoning addObject:[TTTableTextItem itemWithText:shop.name URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];
//    } else {
//      [shopsLiaoning addObject:[TTTableTextItem itemWithText:shop.name_en URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];      
//    }
//  }
//  // NSLog(@"shopsLiaoning %@",shopsLiaoning);
  NSPredicate *predicateSichuan = [NSPredicate predicateWithFormat:@"(province = %@)", @"四川"];
  [fetchRequest setPredicate:predicateSichuan];
  [fetchRequest setEntity:entity];
  NSArray *fetchedSichuan = [context executeFetchRequest:fetchRequest error:&error];
  NSMutableArray  *shopsSichuan = [[NSMutableArray alloc]init];
  for (shop in fetchedSichuan) {
    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
      [shopsSichuan addObject:[TTTableTextItem itemWithText:shop.name URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];
    } else {
      [shopsSichuan addObject:[TTTableTextItem itemWithText:shop.name_en URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];      
    }
  } 
  ////////
  NSPredicate *predicateChongqing = [NSPredicate predicateWithFormat:@"(province = %@)", @"重庆"];
  [fetchRequest setPredicate:predicateChongqing];
  [fetchRequest setEntity:entity];
  NSArray *fetchedChongqing = [context executeFetchRequest:fetchRequest error:&error];
  NSMutableArray  *shopsChongqing = [[NSMutableArray alloc]init];
  for (shop in fetchedChongqing) {
    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
      [shopsChongqing addObject:[TTTableTextItem itemWithText:shop.name URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];
    } else {
      [shopsChongqing addObject:[TTTableTextItem itemWithText:shop.name_en URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];      
    }
  }
  // NSLog(@"shopsChongqing %@",shopsChongqing);
//  NSPredicate *predicateHeilongjiang = [NSPredicate predicateWithFormat:@"(province = %@)", @"黑龙江"];
//  [fetchRequest setPredicate:predicateHeilongjiang];
//  [fetchRequest setEntity:entity];
//  NSArray *fetchedHeilongjiang = [context executeFetchRequest:fetchRequest error:&error];
//  NSMutableArray  *shopsHeilongjiang = [[NSMutableArray alloc]init];
//  for (shop in fetchedHeilongjiang) {
//    if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
//      [shopsHeilongjiang addObject:[TTTableTextItem itemWithText:shop.name URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];
//    } else {
//      [shopsHeilongjiang addObject:[TTTableTextItem itemWithText:shop.name_en URL:[NSString stringWithFormat:@"tt://shop/%@", shop.remote_shop_id]]];      
//    }
//  }
//  // NSLog(@"shopsHeilongjiang %@",shopsHeilongjiang);
  
  if ([current_lang rangeOfString:@"zh-Han"].location != NSNotFound) {
    self.dataSource = [TTSectionedDataSource dataSourceWithArrays:
                       @"北京",  shopsBejing,
                       @"上海",  shopsShanghai,
//                       @"山东",  shopsShandong,
                       @"江苏",  shopsJiangsu,
                       @"浙江",  shopsZejiang,
                       @"福建",  shopsFujian,
//                       @"辽宁",  shopsLiaoning,
                       @"四川",  shopsSichuan,
                       @"重庆",  shopsChongqing,
//                       @"黑龙江", shopsHeilongjiang,                  
                       nil];
    NSLog(@"中文");
  } else {
    self.dataSource = [TTSectionedDataSource dataSourceWithArrays:
                       @"Beijing",  shopsBejing,
                       @"Shanghai",  shopsShanghai,
//                       @"Shandong",  shopsShandong,
                       @"Jiangsu",  shopsJiangsu,
                       @"Zejiang",  shopsZejiang,
                       @"Fujian",  shopsFujian,
//                       @"Liaoning",  shopsLiaoning,
                       @"Sichuan",  shopsSichuan,                       
                       @"Chongqing",  shopsChongqing,
//                       @"Heilongjiang", shopsHeilongjiang,                  
                       nil];
    NSLog(@"English");
  }


  [shopsBejing release];
  [shopsShanghai release];
//  [shopsShandong release];
  [shopsJiangsu release];
  [shopsZejiang release];
  [shopsFujian release];
//  [shopsLiaoning release];
  [shopsChongqing release];
//  [shopsHeilongjiang release];
  shop = nil;
  [fetchRequest release];  
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
