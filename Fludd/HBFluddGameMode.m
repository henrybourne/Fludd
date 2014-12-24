//
//  HBFluddGameMode.m
//  Fludd
//
//  Created by Henry Bourne on 28/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameMode.h"

@implementation HBFluddGameMode

- (id)initWithType:(HBFluddGameModeTypes)type title:(NSString *)title description:(NSString *)description
{
    self = [super init];
    if (self)
    {
        self.type = type;
        self.title = title;
        self.description = description;
    }
    return self;
}

@end
