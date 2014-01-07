//
//  Tutorial_3_View.m
//
//  Created by Shady A. Elyaski.
//  Copyright (c) 2014 Shady A. Elyaski. All rights reserved.
//

#import "Tutorial_Dynamic_View.h"

@implementation Tutorial_Dynamic_View
@synthesize view1;
@synthesize view2;
@synthesize intialView1CenterY;
@synthesize intialView2CenterY;
@synthesize appURL;
@synthesize appDescription;
@synthesize appDownloads;
@synthesize appTopStores;
@synthesize appImg;

#define ENLARGE_SCALE 1

-(void)appBtnPressed {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURL]];
}

- (id)initWithFrame:(CGRect)frame appImage:(NSString *)image appURL:(NSString *)url appDescription:(NSString *)description appDownloads:(NSString *)downloads appTopStores:(NSString *)topStores
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        appImg = [image retain];
        appURL = [url retain];
        appDescription = [description retain];
        appDownloads = [downloads retain];
        appTopStores = [topStores retain];
        
        view2 = [[UILabel alloc] initWithFrame:CGRectMake(35, 208, 250, 185)];
        [view2 setNumberOfLines:0];
        [view2 setTextAlignment:NSTextAlignmentCenter];
        [view2 setTextColor:[UIColor blackColor]];
        [view2 setBackgroundColor:[UIColor clearColor]];
        [view2 setAdjustsFontSizeToFitWidth:YES];
        [view2 setText:appDescription];
        intialView2CenterY = view2.center.y;
        [self addSubview:view2];
        
        view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 200)];
        [view1 setBackgroundColor:[UIColor clearColor]];
        intialView1CenterY = view1.center.y;
        
        UIButton *wasalnyLogoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [wasalnyLogoBtn setFrame:CGRectMake(0, 0, 100, 100)];
        [wasalnyLogoBtn setImage:[UIImage imageNamed:appImg] forState:UIControlStateNormal];
        [wasalnyLogoBtn addTarget:self action:@selector(appBtnPressed) forControlEvents:UIControlEventTouchUpInside];
        [wasalnyLogoBtn setCenter:CGPointMake(view1.center.x+80, 160)];
        [view1 addSubview:wasalnyLogoBtn];
        [wasalnyLogoBtn release];
        
        UIImageView *downloadsBadge_ImgVu = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"downloads_badge"]];
        [downloadsBadge_ImgVu setFrame:CGRectMake(40, 130, 30, 30)];
        [view1 addSubview:downloadsBadge_ImgVu];
        
        UILabel *downloadsLbl = [[UILabel alloc] initWithFrame:CGRectMake(downloadsBadge_ImgVu.frame.origin.x+downloadsBadge_ImgVu.frame.size.width+5, downloadsBadge_ImgVu.frame.origin.y, 110, downloadsBadge_ImgVu.frame.size.height)];
        [downloadsLbl setText:appDownloads];
        [downloadsLbl setFont:[UIFont systemFontOfSize:10]];
        [downloadsLbl setAdjustsFontSizeToFitWidth:YES];
        [view1 addSubview:downloadsLbl];
        [downloadsLbl release];
        
        UIImageView *topBadge_ImgVu = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top_badge"]];
        [topBadge_ImgVu setFrame:CGRectMake(40, 170, 30, 30)];
        [view1 addSubview:topBadge_ImgVu];
        
        UILabel *topLbl = [[UILabel alloc] initWithFrame:CGRectMake(topBadge_ImgVu.frame.origin.x+topBadge_ImgVu.frame.size.width+5, topBadge_ImgVu.frame.origin.y-2, 110, topBadge_ImgVu.frame.size.height)];
        [topLbl setText:appTopStores];
        [topLbl setFont:[UIFont systemFontOfSize:10]];
        [topLbl setNumberOfLines:2];
        [topLbl setAdjustsFontSizeToFitWidth:YES];
        [view1 addSubview:topLbl];
        [topLbl release];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationRepeatAutoreverses:YES];
        [UIView setAnimationRepeatCount:INT_MAX];
        [UIView setAnimationDuration:.4f];
        
        [downloadsBadge_ImgVu setFrame:CGRectMake(downloadsBadge_ImgVu.frame.origin.x-ENLARGE_SCALE, downloadsBadge_ImgVu.frame.origin.y-ENLARGE_SCALE, downloadsBadge_ImgVu.frame.size.width+ENLARGE_SCALE*2, downloadsBadge_ImgVu.frame.size.height+ENLARGE_SCALE*2)];
        [topBadge_ImgVu setFrame:CGRectMake(topBadge_ImgVu.frame.origin.x-ENLARGE_SCALE, topBadge_ImgVu.frame.origin.y-ENLARGE_SCALE, topBadge_ImgVu.frame.size.width+ENLARGE_SCALE*2, topBadge_ImgVu.frame.size.height+ENLARGE_SCALE*2)];
        
        [UIView commitAnimations];
        
        [downloadsBadge_ImgVu release];
        [topBadge_ImgVu release];
        
        [self updateContent];
        
        [self addSubview:view1];
    }
    return self;
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
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animDone)];
        
        [view2 setCenter:CGPointMake(view2.center.x, intialView2CenterY+6)];
        
        [UIView commitAnimations];
    }
}

-(void) updateContent{
    [view1 setCenter:CGPointMake(self.frame.size.width/2, intialView1CenterY)];
    [view2 setCenter:CGPointMake(self.frame.size.width/2, intialView2CenterY)];
}

-(void) invalidate{
    
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
    [appURL release];
    [appDescription release];
    [appDownloads release];
    [appTopStores release];
    [appImg release];
    [view1 release];
    [view2 release];
    [super dealloc];
}

@end
