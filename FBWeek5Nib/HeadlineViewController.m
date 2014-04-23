//
//  HeadlineViewController.m
//  FBWeek5Nib
//
//  Created by Joseph Anderson on 4/22/14.
//  Copyright (c) 2014 yoshyosh. All rights reserved.
//

#import "HeadlineViewController.h"

@interface HeadlineViewController ()

@end

@implementation HeadlineViewController
float initialHeadlineYPosition;
float currentHeadlineYPosition;
float initialPanYPosition;
float currentPanYPosition;

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
    
    UIPanGestureRecognizer *panHeadline = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanMoveHeadline:)];
    [self.headlineViewContainer addGestureRecognizer:panHeadline];
    initialHeadlineYPosition = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onPanMoveHeadline:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        initialPanYPosition = point.y;
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        currentPanYPosition = point.y;
        currentHeadlineYPosition = initialHeadlineYPosition + (currentPanYPosition - initialPanYPosition);
        if (currentHeadlineYPosition < 0){
            currentHeadlineYPosition = currentHeadlineYPosition/10;
        }
        CGRect frame = self.view.frame;
        frame.origin.y = currentHeadlineYPosition;
        self.headlineViewContainer.frame = frame;
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        initialHeadlineYPosition = currentHeadlineYPosition;
        //Run some animation functions here
        if ((velocity.y < 0 && currentHeadlineYPosition < 500) || currentHeadlineYPosition < 150) {
            [self slideHeadlineUp];
        } else if (currentHeadlineYPosition > 150) {
            [self slideHeadlineDown];
        }
    }
}

- (void)slideHeadlineDown {
    [UIView animateWithDuration:.5 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 520;
        self.headlineViewContainer.frame = frame;
    } completion:^(BOOL finished) {
        initialHeadlineYPosition = 520;
    }];
}

- (void)slideHeadlineUp {
    [UIView animateWithDuration:.3 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        self.headlineViewContainer.frame = frame;
    } completion:^(BOOL finished) {
        initialHeadlineYPosition = 0;
    }];
}

@end
