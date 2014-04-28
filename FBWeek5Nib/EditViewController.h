//
//  EditViewController.h
//  FBWeek5Nib
//
//  Created by Joseph Anderson on 4/22/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
- (IBAction)doneEditing:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *savedCard;
@property (strong, nonatomic) IBOutlet UIView *saveableCard;
@property (strong, nonatomic) IBOutlet UIImageView *saveableCardImage;
@property (strong, nonatomic) IBOutlet UIImageView *dropbox;
@property (nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) UIGravityBehavior *gravityBehavior;
@property (strong, nonatomic) IBOutlet UIView *saveableCardContainer;
@property (nonatomic) UIAttachmentBehavior *attachmentBehavior;
@end
