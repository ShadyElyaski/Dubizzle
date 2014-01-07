//
//  Tutorial_3_View.h
//
//  Created by Shady A. Elyaski.
//  Copyright (c) 2014 Shady A. Elyaski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tutorial_Dynamic_View : UIView{
    int NumberOfBounces;

}

- (id)initWithFrame:(CGRect)frame appImage:(NSString *)image appURL:(NSString *)url appDescription:(NSString *)description appDownloads:(NSString *)downloads appTopStores:(NSString *)topStores;

@property(nonatomic, readonly) NSString *appImg;
@property(nonatomic, readonly) NSString *appURL;
@property(nonatomic, readonly) NSString *appDescription;
@property(nonatomic, readonly) NSString *appDownloads;
@property(nonatomic, readonly) NSString *appTopStores;

@property(nonatomic, retain) UIView *view1;
@property(nonatomic, retain) UILabel *view2;

@property(nonatomic, readonly) int intialView1CenterY;
@property(nonatomic, readonly) int intialView2CenterY;

-(void) setAwayDistance:(NSNumber *) distance;
-(void) startBouncing;
-(void) updateContent;
-(void) invalidate;
@end
