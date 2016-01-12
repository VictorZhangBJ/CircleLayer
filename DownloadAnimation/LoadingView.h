//
//  LoadingView.h
//  DownloadAnimation
//
//  Created by mini4s215 on 1/12/16.
//  Copyright © 2016 victor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView
@property (nonatomic, strong) UIColor *fromColor;
@property (nonatomic, strong) UIColor *toColor;

-(void)startAnimation;

-(void)stopAnimation;


@end
