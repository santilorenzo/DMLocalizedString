//
//  DMLocalizationManager.m
//  Noticed
//
//  Created by Lorenzo Santi on 22/07/13.
//  Copyright (c) 2013 DM Digital s.r.l. All rights reserved.
//

#import "DMLocalizationManager.h"

@implementation DMLocalizationManager

+ (id)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

-(id)init{
    self = [super init];
    NSString *defaultLanguage = @"en";
    NSString * preferredlanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    NSFileManager *manager = [[NSFileManager alloc]init];
    NSError *error;
    if([manager fileExistsAtPath:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"Localized_%@",preferredlanguage] ofType:@"json"]]){
        
        NSString *content = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"Localized_%@",preferredlanguage] ofType:@"json"] encoding:NSUTF8StringEncoding error:&error];
        
        NSError *error;
        if (error) {
            NSLog(@"%@",error.userInfo);
        }
        else{
            _dictionary = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
        }
        
    }
    else{
        NSString *content = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"Localized_%@",defaultLanguage] ofType:@"json"] encoding:NSUTF8StringEncoding error:&error];
        
        NSError *error;
        
        if (error) {
            NSLog(@"%@",error.userInfo);
        }
        else{
            _dictionary = [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
        }
    }
    
    return self;
}

-(NSString *)localizedStringForKey:(NSString *)key comment:(NSString *)comment{
    if (_dictionary[key]) {
        return _dictionary[key];
    }
    else if(comment){
        return comment;
    }
    else{
        return key;
    }
}

@end
