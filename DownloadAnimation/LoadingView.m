//
//  LoadingView.m
//  DownloadAnimation
//
//  Created by mini4s215 on 1/12/16.
//  Copyright © 2016 victor. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView()
{
    CGFloat _layerWidth;
    CGFloat _layerHeight;
}

@property (nonatomic, strong)CAShapeLayer* shapeLayer;

@end

@implementation LoadingView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.fromColor = [UIColor blueColor];
        self.toColor = [UIColor whiteColor];
    }
    return self;
}
-(void)setGradientLayer
{
     _layerWidth = self.frame.size.width;
     _layerHeight = self.frame.size.height;
    
    CAGradientLayer *gradientLayer1 = [self gradientLayerWithIndex:0];
    gradientLayer1.position = CGPointMake(_layerWidth/4.0, _layerHeight/4.0);
    gradientLayer1.startPoint = CGPointMake(1, 0);
    gradientLayer1.endPoint = CGPointMake(0, 1);
    
    CAGradientLayer *gradientLayer2 = [self gradientLayerWithIndex:1];
    gradientLayer2.position = CGPointMake(_layerWidth/4.0, _layerHeight/4.0*3);
    gradientLayer2.startPoint = CGPointMake(0, 0);
    gradientLayer2.endPoint = CGPointMake(1, 1);
    
    CAGradientLayer *gradientLayer3 = [self gradientLayerWithIndex:2];
    gradientLayer3.position = CGPointMake(_layerWidth/4.0*3, _layerHeight/4.0*3);
    gradientLayer3.startPoint = CGPointMake(0, 1);
    gradientLayer3.endPoint = CGPointMake(1, 0);
    
    CAGradientLayer *gradientLayer4 = [self gradientLayerWithIndex:3];
    gradientLayer4.position = CGPointMake(_layerWidth/4.0*3, _layerHeight/4.0);
    gradientLayer4.startPoint = CGPointMake(1, 1);
    gradientLayer4.endPoint = CGPointMake(0, 0);
    
}

-(CAGradientLayer *)gradientLayerWithIndex:(NSInteger)index
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, _layerWidth/2.0, _layerHeight/2.0);
    [self.layer addSublayer:gradientLayer];
    gradientLayer.colors = @[(__bridge id)[self colorWithIndex:index].CGColor,
                             (__bridge id)[self colorWithIndex:index+1].CGColor];
    return gradientLayer;
}
-(void)setUp
{
    [self setGradientLayer];
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = self.bounds;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    CGPoint center = CGPointMake(_layerWidth/2.0, _layerHeight/2.0);
    [bezierPath addArcWithCenter:center radius:_layerWidth/2.0-2 startAngle:3*M_PI_2 endAngle:-M_PI_2 clockwise:NO];
    
    
    CAShapeLayer *shapeLayer = self.shapeLayer;
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.lineWidth = 4.0;
    shapeLayer.strokeStart = 0.0;
    shapeLayer.strokeEnd = 0.99;
    //self.layer.mask = self.shapeLayer;
    
}

-(void)startAnimation
{
    [self setUp];
    CABasicAnimation *rotation = [CABasicAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.toValue = @(M_PI*2);
    rotation.duration = 2.0;
    rotation.repeatCount = INFINITY;
    [self.layer addAnimation:rotation forKey:@"rotation"];
}
-(UIColor *)colorWithIndex:(NSInteger)index
{
    CGFloat fromRed,fromGreen,fromBlue,fromAlpha,toRed,toGreen,toBlue,toAlpha;
    [self.fromColor getRed:&fromRed green:&fromGreen blue:&fromBlue alpha:&fromAlpha];
    [self.toColor getRed:&toRed green:&toGreen blue:&toBlue alpha:&toAlpha];
    return [UIColor colorWithRed:gradientColor(fromRed, toRed, index) green:gradientColor(fromGreen, toGreen, index) blue:gradientColor(fromBlue, toBlue, index) alpha:gradientColor(fromAlpha, toAlpha, index)];
}
static float __attribute__((always_inline)) gradientColor(float fromColor, float toColor, int index)
{
    float color = (toColor - fromColor)/4.0 * index + fromColor;
    return color;
}

-(void)stopAnimation
{
    [self.layer removeAnimationForKey:@"totation"];
}


@end
