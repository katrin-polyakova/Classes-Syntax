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
    BOOL result = NO;
    
    CGPoint topRight = CGPointMake(otherRect.origin.x+otherRect.widht,otherRect.origin.y);
    CGPoint bottomLeft = CGPointMake(otherRect.origin.x,otherRect.origin.y+otherRect.heigth);
    CGPoint bottomRight = CGPointMake(otherRect.origin.x+otherRect.widht,otherRect.origin.y+otherRect.heigth);
    
    int pointCounter = [self isPointInRect:otherRect.origin];
    pointCounter = pointCounter + [self isPointInRect:topRight];
    pointCounter = pointCounter + [self isPointInRect:bottomLeft];
    pointCounter = pointCounter + [self isPointInRect:bottomRight];
    if(pointCounter == 4){
        result = YES;
    }
    return result;
}

-(SmartCircle*)circleInscribedInRect{
    float radius;
    if (self.widht<=self.heigth){
        radius = self.widht/2;
    }else{
        radius = self.heigth/2;
    }
    SmartCircle* inscribedCircle = [[SmartCircle alloc] initWithCenter:CGPointMake(self.origin.x, self.origin.y) andRadius:radius];
    
    return inscribedCircle;
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



