//
//  SEViewController.m
//
//  Created by Shady A. Elyaski.
//  Copyright (c) 2014 Shady A. Elyaski. All rights reserved.
//

#import "SEViewController.h"
#import "Tutorial_1_View.h"
#import "Tutorial_Dynamic_View.h"
#import "InfoViewController.h"

@interface SEViewController ()
#define NUMBER_OF_PAGES 4
#define Page(scrlView) scrlView.bounds.origin.x/scrlView.frame.size.width
@end

@implementation SEViewController
@synthesize scrlView;
@synthesize pgCntrl;

-(void) invalidate{
    for (UIView *vu in tutorialViews) {
        [vu performSelector:@selector(invalidate)];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    [scrlView setContentSize:CGSizeMake(NUMBER_OF_PAGES * scrlView.frame.size.width, 0)];
    
    tutorialViews = [NSMutableArray new];
    
    Tutorial_1_View *view1;
    Tutorial_Dynamic_View *view2;
    Tutorial_Dynamic_View *view3;
    Tutorial_Dynamic_View *view4;
    
    view1 = [[Tutorial_1_View alloc] initWithFrame:CGRectMake(0, 0, scrlView.frame.size.width, scrlView.frame.size.height)];
    [scrlView addSubview:view1];
    [tutorialViews addObject:view1];
    [view1 release];
    
    view2 = [[Tutorial_Dynamic_View alloc] initWithFrame:CGRectMake(scrlView.frame.size.width, 0, scrlView.frame.size.width, scrlView.frame.size.height) appImage:@"wasalny_logo" appURL:@"https://itunes.apple.com/us/app/wasalny-wslny/id581879786?mt=8&uo=4" appDescription:@"Wasalny is the first application in Egypt that leverages power of GPS to measure car speeds and detect traffic congestion without affecting battery life. It smartly notifies you of changes in your favorite roads." appDownloads:@"35k+ Downloads" appTopStores:@"Top downloads in Egypt & Kuwait Stores"];
    [scrlView addSubview:view2];
    [tutorialViews addObject:view2];
    [view2 release];
    
    view3 = [[Tutorial_Dynamic_View alloc] initWithFrame:CGRectMake(2*scrlView.frame.size.width, 0, scrlView.frame.size.width, scrlView.frame.size.height) appImage:@"ContactCars_logo" appURL:@"https://itunes.apple.com/us/app/contactcars/id390158823?mt=8&uo=4" appDescription:@"ContactCars is one of the top visited car listing websites in Egypt & the Middle East. It has been used by millions of people to check car prices, reviews & specs. Users can also search for used cars, contact their owner, or even post their own." appDownloads:@"31k+ Downloads" appTopStores:@"Top downloads in Egypt & Saudi Arabia Stores"];
    [scrlView addSubview:view3];
    [tutorialViews addObject:view3];
    [view3 release];
    
    view4 = [[Tutorial_Dynamic_View alloc] initWithFrame:CGRectMake(3*scrlView.frame.size.width, 0, scrlView.frame.size.width, scrlView.frame.size.height) appImage:@"sachabooks_logo" appURL:@"https://itunes.apple.com/us/app/hkayaty/id540251719?mt=8&uo=4" appDescription:@"Sachabooks is an Interactive Children Story Telling platform Targeting Arabic/English/French/More language listeners. Stories include some cool graphics and spoken tracks. Scenes have panning effects, animatable and draggable items, pages can be flipped like a book, children can play simple puzzle games and compete their highscore." appDownloads:@"55k+ Downloads" appTopStores:@"Top downloads in various Arab stores"];
    [scrlView addSubview:view4];
    [tutorialViews addObject:view4];
    [view4 release];
    
    pgCntrl = [[StyledPageControl alloc] initWithFrame:CGRectMake(98, [UIScreen mainScreen].bounds.size.height-95, 125, 36)];
    [pgCntrl setGapWidth:3];
    [pgCntrl setHidesForSinglePage:YES];
    [pgCntrl setNumberOfPages:NUMBER_OF_PAGES];
    [pgCntrl addTarget:self action:@selector(pgCntlChanged:) forControlEvents:UIControlEventValueChanged];
    [pgCntrl setPageControlStyle:PageControlStyleThumb];
    [pgCntrl setThumbImage:[UIImage imageNamed:@"page_bullet"]];
    [pgCntrl setSelectedThumbImage:[UIImage imageNamed:@"page_bullet_active"]];
    [pgCntrl setCoreSelectedColor:[UIColor whiteColor]];
    [self.view addSubview:pgCntrl];
    
    [scrlView setScrollsToTop:NO];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrlView.bounds.origin.x >= 0 && scrlView.bounds.origin.x+scrlView.bounds.size.width <= scrlView.contentSize.width) {
        
        int CurrentPage = Page(scrollView);
        UIView *vu = [tutorialViews objectAtIndex:CurrentPage];
        [vu performSelector:@selector(setAwayDistance:) withObject:[NSNumber numberWithInt:(int)scrlView.bounds.origin.x%(int)scrlView.frame.size.width]];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int CurrentPage = Page(scrollView);
    [pgCntrl setCurrentPage:CurrentPage];
    
    UIView *vu = [tutorialViews objectAtIndex:CurrentPage];
    
    [vu performSelector:@selector(startBouncing)];
}

- (void)viewDidUnload {
    [self setScrlView:nil];
    [self setPgCntrl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    } else {
        return YES;
    }
}

- (void)dealloc {
    [tutorialViews release];
    [scrlView release];
    [pgCntrl release];
    [super dealloc];
}

- (IBAction)infoBtnClicked:(id)sender {
    InfoViewController *vuCntl = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    [vuCntl setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:vuCntl animated:YES completion:nil];
    [vuCntl release];
}

- (void)pgCntlChanged:(StyledPageControl *)sender {
    [UIView animateWithDuration:.3f animations:^{
        [scrlView setContentOffset:CGPointMake([sender currentPage]*scrlView.frame.size.width, 0) animated:NO];
    } completion:^(BOOL finished) {
        UIView *vu = [tutorialViews objectAtIndex:[sender currentPage]];
        
        [vu performSelector:@selector(startBouncing)];
    }];
}

@end
