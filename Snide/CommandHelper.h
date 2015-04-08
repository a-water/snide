//
//  CommandHelper.h
//  Snide
//
//  Created by Aaron Waterhouse on 4/6/15.
//  Copyright (c) 2015 Aaron Waterhouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommandHelper : NSObject

+(void)toggleIcons:(BOOL)hideIcons;
+(BOOL)areIconsShowing;

@end
