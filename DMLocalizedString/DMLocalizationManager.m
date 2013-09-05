//
//  DMLocalizationManager.m
//  DMLocalizedString
//
//  The MIT License (MIT)
//
//  Copyright (c) <2013> <DMDigital s.r.l.>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
