//
//  DistanceFinderAppDelegate.h
//  DistanceFinder
//
//  Created by Eric Wagner on 2/5/11.
//  Copyright 2011 3rdPart. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DistanceFinderViewController;

@interface DistanceFinderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DistanceFinderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DistanceFinderViewController *viewController;

@end

