#import <Foundation/Foundation.h>
#import "SmartCircle.h"
#import "SmartRect.h"
#import <math.h>

@implementation SmartCircle

-(instancetype)initWithCenter:(CGPoint)center andRadius:(float)radius{
    self = [super init];
    if (self){
        self.center = center;
        self.radius = radius;
    }
    return self;
}

-(float)square{
    float result = M_PI*self.radius*self.radius;
    return result;
}

-(BOOL)isPointInCircle:(CGPoint)point{
    BOOL result = NO;
    float distanceBetweenPoints = sqrtf(powf((point.x-self.center.x),2)+powf((point.y-self.center.y),2));
    if (distanceBetweenPoints <= self.radius)
    {
        result = YES;
    }
    return result;
}

-(BOOL)isRectInsideCircle:(SmartRect*)rectangle{
    BOOL result = NO;
    
    CGPoint topRight = CGPointMake(rectangle.origin.x+rectangle.widht,rectangle.origin.y);
    CGPoint bottomLeft = CGPointMake(rectangle.origin.x,rectangle.origin.y+rectangle.heigth);
    CGPoint bottomRigt = CGPointMake(rectangle.origin.x+rectangle.widht,rectangle.origin.y+rectangle.heigth);
    
    int pointCounter = [self isPointInCircle:rectangle.origin];
    pointCounter = pointCounter + [self isPointInCircle:topRight];
    pointCounter = pointCounter + [self isPointInCircle:bottomLeft];
    pointCounter = pointCounter + [self isPointInCircle:bottomRigt];
    
    if(pointCounter == 4){
        result = YES;
    }
    return result;
}

- (NSString *)description{
    NSString* result;
    result = [NSString stringWithFormat:@"x:%g y:%g radius:%g", self.center.x, self.center.y, self.radius];
    
    return result;
}

@end