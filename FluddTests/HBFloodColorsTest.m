//
//  HBFloodColorsTest.m
//  Fludd
//
//  Created by Henry Bourne on 22/04/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HBFluddColorSets.h"

@interface HBFloodColorsTest : XCTestCase

@end

@implementation HBFloodColorsTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testColorAtIndex {
    HBFluddColorSets *colors = [[HBFluddColorSets alloc] init];
    
    XCTAssertTrue([colors colorAtIndex:0]  [UIColor colorWithRed:0.741 green:0.314 blue:0.314 alpha:1], @"fjhsdkfbjs");
}

@end
