//
//  DistanceFinderViewController.h
//  DistanceFinder
//
//  Created by Eric Wagner on 2/5/11.
//  Copyright 2011 3rdPart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DistanceFinderViewController : UIViewController <CLLocationManagerDelegate> {
    IBOutlet UILabel *originCoordinatesLabel;
    IBOutlet UILabel *distanceLabel;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    CLLocation *originLocation;
    BOOL isManagerInitialized;
    BOOL isOriginSet;
}

- (IBAction)setOrigin;

-(void)redraw;
-(void)redrawOriginCoordinatesLabel;
-(void)redrawDistanceLabel;

@end

