//
//  Tutorial_1_View.m
//
//  Created by Shady A. Elyaski.
//  Copyright (c) 2014 Shady A. Elyaski. All rights reserved.
//

#import "Tutorial_1_View.h"

@implementation Tutorial_1_View
@synthesize view1;
@synthesize view2;
@synthesize intialView1CenterY;
@synthesize intialView2CenterY;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        view1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Dubizzle_Logo"]];
        intialView1CenterY = self.frame.size.height/2-40;
        [view1 setCenter:CGPointMake(self.frame.size.width/2, intialView1CenterY)];
        [self addSubview:view1];
        
        view2 = [[UILabel alloc] initWithFrame:CGRectMake(35, 235, 250, 150)];
        [view2 setNumberOfLines:0];
        [view2 setTextAlignment:NSTextAlignmentCenter];
        [view2 setTextColor:[UIColor blackColor]];
        [view2 setBackgroundColor:[UIColor clearColor]];
        
        intialView2CenterY = self.frame.size.height/2+5;
        [view2 setCenter:CGPointMake(self.frame.size.width/2, intialView2CenterY)];
        [self addSubview:view2];
        
        [self updateContent];
    }
    return self;
}

-(void) invalidate{
    
}

-(void) setAwayDistance:(NSNumber *) d{
    int distance = [d intValue];
    [view1 setCenter:CGPointMake(view1.center.x, intialView1CenterY-distance)];
    [view2 setCenter:CGPointMake(view2.center.x, intialView2CenterY+distance)];
}

-(void)animDone{
    NumberOfBounces++;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.16f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(startBouncing)];
    
    [view2 setCenter:CGPointMake(view2.center.x, view2.center.y-6)];
    
    [UIView commitAnimations];
}

-(void) startBouncing{
    if (NumberOfBounces >= 2) {
        NumberOfBounces = 0;
    }else{
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:.16f];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        //    [UIView setAnimationRepeatCount:3];
        //    [UIView setAnimationRepeatAutoreverses:YES];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animDone)];
        
        [view2 setCenter:CGPointMake(view2.center.x, intialView2CenterY+6)];
        
        [UIView commitAnimations];
    }
}

-(void) updateContent{
    [view2 setText:@"Buy Sell Find Anything"];
    [view1 setCenter:CGPointMake(self.frame.size.width/2, intialView1CenterY)];
    [view2 setCenter:CGPointMake(self.frame.size.width/2, intialView2CenterY)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)dealloc{
    [view1 release];
    [view2 release];
    [super dealloc];
}

@end
