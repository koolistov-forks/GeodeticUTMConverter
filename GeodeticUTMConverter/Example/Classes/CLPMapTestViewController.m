//
//  MapTest.m
//  UTMConverter
//
//  Created by Cameron Lowell Palmer & Mariia Ruchko on 19.06.12.
//  Copyright (c) 2012 Cameron Lowell Palmer & Mariia Ruchko. All rights reserved.
//

#import "CLPMapTestViewController.h"

#import "GeodeticUTMConverter.h"
#import "CLPAddressAnnotation.h"



@interface CLPMapTestViewController ()
@end



@implementation CLPMapTestViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    UTMCoordinates coordinates;
    coordinates.gridZone = 32;
    coordinates.northing = 6643010;
    coordinates.easting = 598430;
    coordinates.hemisphere = kUTMHemisphereNorthern;
    
    GeodeticUTMConverter *converter = [[GeodeticUTMConverter alloc] init];
    CLLocationCoordinate2D groenland = [converter UTMCoordinatesToLatitudeAndLongitude:coordinates];
    
    CLPAddressAnnotation *annotationAddress = [[CLPAddressAnnotation alloc] initWithCoordinate:groenland];
    
    [self.mapView addAnnotation:annotationAddress];
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta=0.005;
    span.longitudeDelta=0.005; 
    
    region.span=span;
    region.center=groenland;
    
    [self.mapView setRegion:region animated:TRUE];
    [self.mapView regionThatFits:region];
}

@end
