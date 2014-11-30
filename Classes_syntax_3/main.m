//  main.m
//  Classes_syntax_3
//
//  Created by Kate Polyakova on 11/23/14.
//  Copyright (c) 2014 Kate Polyakova. All rights reserved.

#import <Foundation/Foundation.h>
#import "SmartRect.h"
#import "SmartCircle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\n--------SmartRect--------");
        SmartRect *rect = [[SmartRect alloc] initWithOrigin:CGPointMake(45,56) andWidth:80 andHeight:60];
        //        rect.origin = CGPointMake(45,56);
        //        rect.widht = 80;
        //        rect.heigth = 60;
        CGPoint pointCenter = [rect center];
        NSLog(@"\n\tRectangle:%@\n\tSquare:%g\n\tCenter:{%g,%g}\n\tDiagonal:%g", [rect description], [rect square], pointCenter.x, pointCenter.y, [rect diagonal]);
        
        NSLog(@"\n--------Point in Rectangle--------");
        CGPoint point1 = CGPointMake(60,70);
        BOOL pointInRect1 = [rect isPointInRect:(CGPoint) point1];
        NSLog(@"\n\tPoint{%g,%g} is %@ Rectangle: %@ ", point1.x, point1.y, pointInRect1?@"in":@"out",[rect description]);
        CGPoint point2 = CGPointMake(30,140);
        BOOL pointInRect2 = [rect isPointInRect:(CGPoint) point2];
        NSLog(@"\n\tPoint{%g,%g} is %@ Rectangle: %@ ", point2.x, point2.y, pointInRect2?@"in":@"out",[rect description]);
        
        NSLog(@"\n--------First Rectangle is in Second Rectangle--------");
        SmartRect *otherRect = [[SmartRect alloc] initWithOrigin:CGPointMake(50,60) andWidth:40 andHeight:35];
        BOOL otherRectInRect = [rect isOtherRectInsideRect:(SmartRect*) otherRect];
        NSLog(@"\n\tRectangle: %@ is %@ Rectangle: %@", [otherRect description], otherRectInRect?@"in":@"out of", [rect description] );
        SmartRect *otherRect1 = [[SmartRect alloc] initWithOrigin:CGPointMake(50,60) andWidth:100 andHeight:50];
        BOOL otherRect1InRect = [rect isOtherRectInsideRect:(SmartRect*) otherRect1];
        NSLog(@"\n\tRectangle: %@ is %@ Rectangle: %@", [otherRect1 description], otherRect1InRect?@"in":@"out of", [rect description] );
        
        
        NSLog(@"\n--------SmartCircle--------");
        SmartCircle *circle = [[SmartCircle alloc] initWithCenter:CGPointMake(80,60) andRadius:35];
        NSLog(@"\n\tCircle:%@\n\tSquare:%g", [circle description], [circle square]);
        
        NSLog(@"\n--------Point in Circle--------");
        CGPoint point3 = CGPointMake(70, 80);
        BOOL pointInCircle1 = [circle isPointInCircle:(CGPoint) point3];
        NSLog(@"\n\tPoint{%g,%g} is %@ Circle: %@", point3.x, point3.y, pointInCircle1?@"in":@"out of", [circle description]);
        CGPoint point4 = CGPointMake(50, 30);
        BOOL pointInCircle2 = [circle isPointInCircle:CGPointMake(50,30)];
        NSLog(@"\n\tPoint{%g,%g} is %@ Circle: %@", point4.x, point4.y, pointInCircle2?@"in":@"out of", [circle description]);
        
        NSLog(@"\n--------Rectangle is in Circle--------");
        SmartRect *rectangle1 = [[SmartRect alloc] initWithOrigin:CGPointMake(60,50) andWidth:30 andHeight:36];
        BOOL rect1InCircle = [circle isRectInsideCircle:(SmartRect*) rectangle1];
        NSLog(@"\n\tRectangle: %@ is %@ Circle: %@", [rectangle1 description], rect1InCircle?@"in":@"out of", [circle description] );
        SmartRect *rectangle2 = [[SmartRect alloc] initWithOrigin:CGPointMake(50,60) andWidth:40 andHeight:35];
        BOOL rect2InCircle = [circle isRectInsideCircle:(SmartRect*) rectangle2];
        NSLog(@"\n\tRectangle: %@ is %@ Circle: %@", [rectangle2 description], rect2InCircle?@"in":@"out of", [circle description] );
        
        NSLog(@"\n--------Circle inscribed in Rect--------");
        SmartCircle* inscrCircle = [rect circleInscribedInRect];
        NSLog(@"\n\tCircle: %@ inscribed in Rectangle: %@",[inscrCircle description], [rect description]);
        
//        SmartRect *rect1 = [[SmartRect alloc] initWithOrigin:CGPointMake(0,0) andWidth:300 andHeight:200];
//        NSLog(@"%@\n", [rect1 description]);
        
    }
    return 0;
}

