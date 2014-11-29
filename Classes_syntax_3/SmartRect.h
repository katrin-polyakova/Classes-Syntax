@interface SmartRect : NSObject

@property(nonatomic) CGPoint origin;

@property(nonatomic) float widht;
@property(nonatomic) float heigth;

-(instancetype)initWithOrigin:(CGPoint)origin andWidth:(float)width andHeight:(float)height;
-(float)square;
-(CGPoint)center;
-(float)diagonal;
-(BOOL)isPointInRect:(CGPoint)point;
-(BOOL)isOtherRectInsideRect:(SmartRect*)otherRect;
-(float)circleInscribedInRect;
-(SmartRect*)intersectionWithRect:(SmartRect*)otherRect;

@end
