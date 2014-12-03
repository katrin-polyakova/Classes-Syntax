#import <Foundation/Foundation.h>

@class SmartRect;
@class SmartCircle;

@interface SmartTriangle : NSObject

@property (nonatomic) CGPoint pointA;
@property (nonatomic) CGPoint pointB;
@property (nonatomic) CGPoint pointC;

-(instancetype)initWithPointA:(CGPoint)pointA andPointB:(CGPoint)pointB andPointC:(CGPoint)pointC;
-(float)perimeter;
-(float)square;
-(CGPoint)centroid;
-(void)printToLog;
-(BOOL)isPointInTriangle:(CGPoint)point;
-(BOOL)isOtherTriangleInsideTriangle:(SmartTriangle*)otherTriangle;
-(SmartTriangle*)triangleTrWithRect:(SmartRect*)rectTr andCircle:(SmartCircle*)circleTr;
-(SmartCircle*)circleInscribedInTriangle;

@end
