//
//  AppDelegate.m
//  Snide
//
//  Created by Aaron Waterhouse on 4/6/15.
//  Copyright (c) 2015 Aaron Waterhouse. All rights reserved.
//

#import "AppDelegate.h"
#import "CommandHelper.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSStatusItem *statusItem;
@property (assign, nonatomic) BOOL isHidingEnabled;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.isHidingEnabled = ![CommandHelper areIconsShowing];
    
    // Init the status bar button with the image
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    [self determineIconState];
}

- (void) determineIconState{
    
    NSImage *menuBarImage = [NSImage imageNamed:@"bat23"];
    NSImage *menuBarImageSelected = [NSImage imageNamed:@"bat23_selected"];
    
    // Check if system is running anything less than 10.10
    BOOL preYosemite = (floor(NSAppKitVersionNumber) <= NSAppKitVersionNumber10_9);
    if(!preYosemite) {
        [menuBarImage setTemplate:YES];
        [menuBarImageSelected setTemplate:YES];
    }
    
    if(self.isHidingEnabled) {
        [self.statusItem setImage:menuBarImageSelected];
        self.isHidingEnabled = false;
    } else {
        [self.statusItem setImage:menuBarImage];
        self.isHidingEnabled = true;
    }
    
    [self.statusItem setAction:@selector(iconClicked:)];
}

- (void)iconClicked:(id)sender {
    
    [self determineIconState];
    [CommandHelper toggleIcons:self.isHidingEnabled];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
