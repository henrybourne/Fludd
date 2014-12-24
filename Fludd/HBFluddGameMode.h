//
//  HBFluddGameMode.h
//  Fludd
//
//  Created by Henry Bourne on 28/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HBFluddGameModeTypes) {
    HBFluddGameModeTypeNormal,
    HBFluddGameModeTypeWalls,
    HBFluddGameModeTypeTimed
};

@interface HBFluddGameMode : NSObject

@property HBFluddGameModeTypes type;
@property NSString *title;
@property NSString *description;

- (id)initWithType:(HBFluddGameModeTypes)type title:(NSString *)title description:(NSString *)description;

@end
