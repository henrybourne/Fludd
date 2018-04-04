//
//  HBFluddGameMode.m
//  Fludd
//
//  Created by Henry Bourne on 28/05/2014.
//  Copyright (c) 2014 Henry Bourne. All rights reserved.
//

#import "HBFluddGameMode.h"

@implementation HBFluddGameMode

- (id)initWithType:(HBFluddGameModeTypes)type title:(NSString *)title description:(NSString *)desc
{
    self = [super init];
    if (self)
    {
        self.type = type;
        self.title = title;
        self.desc = desc;
    }
    return self;
}

@end
