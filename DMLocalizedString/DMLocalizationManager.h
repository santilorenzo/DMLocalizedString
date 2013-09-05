//
//  DMLocalizationManager.h
//  Noticed
//
//  Created by Lorenzo Santi on 22/07/13.
//  Copyright (c) 2013 DM Digital s.r.l. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DMLocalizedString(_key,_comment) [[DMLocalizationManager sharedInstance]localizedStringForKey:(_key) comment:(_comment)]

@interface DMLocalizationManager : NSObject{
    NSDictionary *_dictionary;
}
+(id)sharedInstance;
-(NSString *)localizedStringForKey:(NSString *)key comment:(NSString *)comment;

@end
