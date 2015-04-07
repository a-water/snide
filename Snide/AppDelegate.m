//
//  AppDelegate.m
//  Snide
//
//  Created by Aaron Waterhouse on 4/6/15.
//  Copyright (c) 2015 Aaron Waterhouse. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (assign, nonatomic) BOOL darkModeOn;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    // Init the status bar button with the image
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    NSImage *menuBarImage = [NSImage imageNamed:@"bat23"];
    // Check if system is running anything less than 10.10
    BOOL oldBusted = (floor(NSAppKitVersionNumber) <= NSAppKitVersionNumber10_9);
    if(!oldBusted) {
        [menuBarImage setTemplate:YES];
    }
    [self.statusItem setImage:menuBarImage];
    
    [self.statusItem setAction:@selector(buttonClicked:)];
}

- (void)buttonClicked:(id)sender {
    NSLog(@"bat clicked");
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
