#import "SmartRect.h"

@interface SmartCircle : NSObject

@property(nonatomic) CGPoint center;

@property(nonatomic) float radius;

-(instancetype)initWithCenter:(CGPoint)center andRadius:(float)radius;
-(float)square;
-(BOOL)isPointInCircle:(CGPoint)point;
-(BOOL)isRectInsideCircle:(SmartRect*)rectangle;


@end
