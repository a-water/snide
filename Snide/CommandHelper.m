//
//  CommandHelper.m
//  Snide
//
//  Created by Aaron Waterhouse on 4/6/15.
//  Copyright (c) 2015 Aaron Waterhouse. All rights reserved.
//

#import "CommandHelper.h"

NSString *const DEFAULTS_PATH = @"/usr/bin/defaults";

@implementation CommandHelper

+ (void) toggleIcons:(BOOL)hideIcons {
    
    NSTask *toggleTask = [[NSTask alloc]init];
    [toggleTask setLaunchPath:DEFAULTS_PATH];
    
    NSString *hideOrShow = hideIcons ? @"true" : @"false";
    NSArray *args = [NSArray arrayWithObjects:@"write", @"com.apple.finder", @"CreateDesktop", @"-bool", hideOrShow, nil];
    
    [toggleTask setArguments:args];
    [toggleTask launch];
    
    NSTask *killTask = [[NSTask alloc]init];
    [killTask setLaunchPath:@"/usr/bin/killall"];
    [killTask setArguments:[NSArray arrayWithObjects:@"Finder", nil]];
    [killTask launch];
    
}

+ (BOOL) areIconsShowing {
    NSTask *checkDefaultsTask = [[NSTask alloc]init];
    [checkDefaultsTask setLaunchPath:DEFAULTS_PATH];
    
    NSArray *args = [NSArray arrayWithObjects:@"read", @"com.apple.finder", @"CreateDesktop", nil];
    [checkDefaultsTask setArguments:args];
    
    NSPipe *output = [NSPipe pipe];
    [checkDefaultsTask setStandardOutput:output];
    
    [checkDefaultsTask launch];
    
    NSFileHandle *read = [output fileHandleForReading];
    NSData *dataRead = [read readDataToEndOfFile];
    NSString *stringRead = [[NSString alloc] initWithData:dataRead encoding:NSUTF8StringEncoding];
    BOOL isHidden = [stringRead boolValue];
                     
    return isHidden;
}

@end


