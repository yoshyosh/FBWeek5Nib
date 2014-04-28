//
//  EditViewController.m
//  FBWeek5Nib
//
//  Created by Joseph Anderson on 4/22/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (nonatomic) UISnapBehavior *snapBehavior;
@property (nonatomic) UIAttachmentBehavior *rootCardAttachmentBehavior;
@end

@implementation EditViewController
float initialCardYPosition;
float initialCardXPosition;
float initialCardPanYPosition;
float initialCardPanXPosition;
float currentCardYPosition;
float currentCardXPosition;

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
    
    UIPanGestureRecognizer *panCardGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveSaveableCard:)];
    [self.saveableCardContainer addGestureRecognizer:panCardGesture];
    initialCardYPosition = self.saveableCard.frame.origin.y;
    initialCardXPosition = self.saveableCard.frame.origin.x;
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    NSArray *itemsWithGravity = @[self.saveableCardImage];
    self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:itemsWithGravity];
    [self.animator addBehavior:self.gravityBehavior];
    
    CGPoint anchorPoint = CGPointMake(self.saveableCard.center.x, self.saveableCard.center.y);
    UIOffset attachmentOffset = UIOffsetMake(0, -20);
    self.rootCardAttachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.saveableCardContainer attachedToAnchor:anchorPoint];
    self.attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.saveableCardImage offsetFromCenter:attachmentOffset attachedToItem:self.saveableCardContainer offsetFromCenter:UIOffsetZero];
    
    //self.attachmentBehavior.frequency = .1;
    self.attachmentBehavior.length = 0;
    //self.attachmentBehavior.damping = .1;
    
    [self.animator addBehavior:self.rootCardAttachmentBehavior];
    [self.animator addBehavior:self.attachmentBehavior];
    
    self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.saveableCard snapToPoint:self.dropbox.center];
    self.snapBehavior.damping = .9;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneEditing:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)moveSaveableCard:(UIGestureRecognizer *)panGestureRecognizer {
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    self.rootCardAttachmentBehavior.anchorPoint = CGPointMake(point.x, point.y + 60);
//    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
//        initialCardPanYPosition = point.y;
//        initialCardPanXPosition = point.x;
//        //How to pass card that is being moved (target) to this method, maybe add selector method
//        [self animateIncreaseCardSize];
//    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged){
//        currentCardYPosition = initialCardYPosition + (point.y - initialCardPanYPosition);
//        currentCardXPosition = initialCardXPosition + (point.x - initialCardPanXPosition);
//        //CGRect frame = self.saveableCardContainer.frame;
//        //frame.origin.y = currentCardYPosition;
//        //frame.origin.x = currentCardXPosition;
//        //self.saveableCardContainer.frame = frame;
//    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
//        initialCardYPosition = currentCardYPosition;
//        initialCardXPosition = currentCardXPosition;
//        [self animateDecreaseCardSize];
//        //[self.animator removeBehavior:self.snapBehavior];
//        //[self.animator addBehavior:self.snapBehavior];
//    }
}

- (void)animateIncreaseCardSize {
    [UIView animateWithDuration:.2 animations:^{
        CGRect frame = self.saveableCardImage.frame;
        frame.size = CGSizeMake(141, 244);
        self.saveableCardImage.frame = frame;
        //Need to center it
    } completion:nil];
}

- (void)animateDecreaseCardSize {
    [UIView animateWithDuration:.2 animations:^{
        CGRect frame = self.saveableCardImage.frame;
        frame.size = CGSizeMake(131, 231);
        self.saveableCardImage.frame = frame;
        //Need to center it
    } completion:nil];
}

@end
