//
//  HBFluddGameSize.h
//  Fludd
//
//  Created by Henry Bourne on 26/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBFluddGameSize : NSObject

@property int numberOfCells;
@property int movesAllowed;
@property NSString *title;

- (id)initWithNumberOfCells:(int)numberOfCells movesAllowed:(int)movesAllowed;

@end
