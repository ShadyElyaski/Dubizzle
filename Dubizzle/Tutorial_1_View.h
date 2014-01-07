//
//  Tutorial_1_View.h
//
//  Created by Shady A. Elyaski.
//  Copyright (c) 2014 Shady A. Elyaski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tutorial_1_View : UIView{
    int NumberOfBounces;
}
@property(nonatomic, retain) UIImageView *view1;
@property(nonatomic, retain) UILabel *view2;

@property(nonatomic, readonly) int intialView1CenterY;
@property(nonatomic, readonly) int intialView2CenterY;

-(void) setAwayDistance:(NSNumber *) distance;
-(void) startBouncing;
-(void) updateContent;
-(void) invalidate;
@end
