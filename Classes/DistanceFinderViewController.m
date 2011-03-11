//
//  DistanceFinderViewController.m
//  DistanceFinder
//
//  Created by Eric Wagner on 2/5/11.
//  Copyright 2011 3rdPart. All rights reserved.
//

#import "DistanceFinderViewController.h"

@implementation DistanceFinderViewController

- (IBAction)setOrigin {
    isOriginSet = TRUE;
    NSLog(@"setting origin");
    originLocation = currentLocation;
    [originLocation retain];
    [self redraw];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
    isManagerInitialized = FALSE;
    isOriginSet = FALSE;
    locationManager = [[CLLocationManager alloc] init];
	[locationManager setDelegate:self];
	[locationManager setDistanceFilter:kCLDistanceFilterNone];
	[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
	[locationManager startUpdatingLocation];
}

#pragma mark Location Manager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"location: %@", newLocation);
    isManagerInitialized = TRUE;
    [currentLocation autorelease];
	currentLocation = newLocation;
    [currentLocation retain];
	[self redraw];
	
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	NSLog(@"Could not find location: %@", error);
}

#pragma mark Redraw

-(void)redraw
{
    NSLog(@"redraw");
    [self redrawOriginCoordinatesLabel];
    [self redrawDistanceLabel];
}

-(void)redrawOriginCoordinatesLabel
{
    if (isManagerInitialized) {
        if (isOriginSet) {
            NSLog(@"%@", originLocation);
            [originCoordinatesLabel setText:[NSString stringWithFormat:@"%fN %fW (±%0.fm)", originLocation.coordinate.latitude, -originLocation.coordinate.longitude, originLocation.horizontalAccuracy]];
        } else {
            [originCoordinatesLabel setText:@"ready"];                    
        }
    } else {
        [originCoordinatesLabel setText:@"initializing"];
    }

}

-(void)redrawDistanceLabel
{
    if (isManagerInitialized) {
        if (isOriginSet) {
            [distanceLabel setText:[NSString stringWithFormat:@"%f m (±%0.fm)", [originLocation distanceFromLocation:currentLocation], currentLocation.horizontalAccuracy]];
        } else {
            [distanceLabel setText:@"ready"];                    
        }
    } else {
        [distanceLabel setText:@"initializing"];

    }
    
}

#pragma mark Memory Management


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [originCoordinatesLabel release];
    [distanceLabel release];
    [locationManager release];
    [currentLocation release];
    [originLocation release];
    [super dealloc];
}

@end
