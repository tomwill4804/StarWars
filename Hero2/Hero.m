//
//  Hero.m
//  Hero2
//
//  Created by Tom Williamson on 4/22/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "Hero.h"

@implementation Hero

- (instancetype)init
{
    self = [super init];
    if (self) {
       
    }
    return self;
}

//
//  create a Hero object using passed dictionary
//
+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict
{
    Hero *hero = nil;
    if (heroDict) {
        hero = [[Hero alloc] init];
        
        hero.name = heroDict[@"name"];
        hero.desc = heroDict[@"description"];
        hero.celltype = heroDict[@"type"];
        hero.image = heroDict[@"image"];
    }
    
    return hero;
    
}


@end
