//
//  SEViewController.h
//
//  Created by Shady A. Elyaski.
//  Copyright (c) 2014 Shady A. Elyaski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StyledPageControl.h"

@interface SEViewController : UIViewController<UIScrollViewDelegate>{
    NSMutableArray *tutorialViews;
}
@property (retain, nonatomic) IBOutlet UIScrollView *scrlView;
@property (retain, nonatomic) StyledPageControl *pgCntrl;
- (IBAction)infoBtnClicked:(id)sender;
- (void)pgCntlChanged:(UIPageControl *)sender;
- (void) invalidate;


@end
