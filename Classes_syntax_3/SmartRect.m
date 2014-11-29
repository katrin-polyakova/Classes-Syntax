#import <Foundation/Foundation.h>
#import "SmartRect.h"
#import "SmartCircle.h"
#import <math.h>

@implementation SmartRect

-(instancetype)initWithOrigin:(CGPoint)origin andWidth:(float)width andHeight:(float)height{
    self = [super init];
    if (self){
        self.origin = origin;
        self.widht = width;
        self.heigth = height;
    }
    return self;
}

-(float)square{
    float result = self.heigth * self.widht;
    return result;
}

-(CGPoint)center{
    CGPoint result = {self.origin.x+self.widht/2,self.origin.y+self.heigth/2};
    return result;
}

-(float)diagonal{
    float result = sqrtf(powf(self.widht,2)+powf(self.heigth,2));
    return result;
}

-(BOOL)isPointInRect:(CGPoint)point{
    int result = NO;
    if ( (self.origin.x <= point.x) && (point.x <= (self.origin.x+self.widht)) && (self.origin.y <= point.y) && (point.y <= (self.origin.y+self.heigth)) ){
        result = YES;
    }
    return result;
}

-(BOOL)isOtherRectInsideRect:(SmartRect*)otherRect{
    int result = NO;
    int pointCounter = [self isPointInRect:otherRect.origin];
    pointCounter = pointCounter + [self isPointInRect:CGPointMake(otherRect.origin.x+otherRect.widht,otherRect.origin.y)];
    pointCounter = pointCounter + [self isPointInRect:CGPointMake(otherRect.origin.x,otherRect.origin.y+otherRect.heigth)];
    pointCounter = pointCounter + [self isPointInRect:CGPointMake(otherRect.origin.x+otherRect.widht,otherRect.origin.y+otherRect.heigth)];
    if(pointCounter == 4){
        result = YES;
    }
    return result;
}

-(NSString*)circleInscribedInRect{
    CGPoint center = self.origin;
    int radius;
    if (self.widht<=self.heigth){
        radius = self.widht/2;
    }
    else{
        radius = self.heigth/2;
    }
    NSString* result = [NSString stringWithFormat:@"x:%g y:%g radius:%d", center.x, center.y, radius];
        
    return result;
    }

-(SmartRect*)intersectionWithRect:(SmartRect*)otherRect{
    
    SmartRect* result;
    return result;
}

- (NSString *)description{
    NSString* result;
    result = [NSString stringWithFormat:@"x:%g y:%g width:%g heith:%g", self.origin.x, self.origin.y, self.widht, self.heigth];
    
    return result;
}

@end



