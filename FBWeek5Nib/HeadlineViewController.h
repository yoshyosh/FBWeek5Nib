//
//  HeadlineViewController.h
//  FBWeek5Nib
//
//  Created by Joseph Anderson on 4/22/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadlineViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *headlineViewContainer;
@property (strong, nonatomic) IBOutlet UIImageView *headlineImage;
- (IBAction)editSectionButton:(id)sender;

@end
