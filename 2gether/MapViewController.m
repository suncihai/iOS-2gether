//
//  MapViewController.m
//  2gether
//
//  Created by suncihai on 15/12/3.
//  Copyright (c) 2015年 suncihai. All rights reserved.
//

#import "MapViewController.h"
#import "JPSThumbnailAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Map View
    mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    mapView.delegate = self;
    [self.view addSubview:mapView];
    
    // Annotations
    [mapView addAnnotations:[self generateAnnotations]];
    
    MKCoordinateRegion kaos_digital;
    
    kaos_digital.center.latitude=38.84;
    kaos_digital.center.longitude=-77.11;
    
    kaos_digital.span.latitudeDelta=0.10;
    kaos_digital.span.longitudeDelta=0.10;
    
    [mapView setRegion:kaos_digital];
}

- (NSArray *)generateAnnotations {
    NSMutableArray *annotations = [[NSMutableArray alloc] initWithCapacity:5];
    
    // Room1
    JPSThumbnail *Room1 = [[JPSThumbnail alloc] init];
    Room1.image = [UIImage imageNamed:@"beer.png"];
    Room1.title = @"Who comes?";
    Room1.subtitle = @"Drinking";
    Room1.coordinate = CLLocationCoordinate2DMake(38.85, -77.12);
    Room1.disclosureBlock = ^{ NSLog(@"selected Room1"); };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:Room1]];
    
    // Room2
    JPSThumbnail *Room2 = [[JPSThumbnail alloc] init];
    Room2.image = [UIImage imageNamed:@"sushi.png"];
    Room2.title = @"Anyone likes Sushi?";
    Room2.subtitle = @"Sushi bar";
    Room2.coordinate = CLLocationCoordinate2DMake(38.84, -77.10);
    Room2.disclosureBlock = ^{ NSLog(@"selected Room2"); };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:Room2]];
    
    // Room3
    JPSThumbnail *Room3 = [[JPSThumbnail alloc] init];
    Room3.image = [UIImage imageNamed:@"shopping.png"];
    Room3.title = @"Girls Come!";
    Room3.subtitle = @"Pengtagon Mall";
    Room3.coordinate = CLLocationCoordinate2DMake(38.86, -77.06);
    Room3.disclosureBlock = ^{ NSLog(@"selected Room3"); };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:Room3]];
    
    // Room4
    JPSThumbnail *Room4 = [[JPSThumbnail alloc] init];
    Room4.image = [UIImage imageNamed:@"cards.png"];
    Room4.title = @"Play Board Game!";
    Room4.subtitle = @"Big Bang!";
    Room4.coordinate = CLLocationCoordinate2DMake(38.81, -77.10);
    Room4.disclosureBlock = ^{ NSLog(@"selected Room4"); };
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:Room4]];
    
    // Room5
    JPSThumbnail *Room5 = [[JPSThumbnail alloc] init];
    Room5.image = [UIImage imageNamed:@"desert.png"];
    Room5.title = @"Looking for girls!";
    Room5.subtitle = @"Cup Cake~~";
    Room5.coordinate = CLLocationCoordinate2DMake(38.905, -77.06);
    Room5.disclosureBlock = ^{ NSLog(@"selected Room5"); };
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:Room5]];

    return annotations;
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if ([view conformsToProtocol:@protocol(JPSThumbnailAnnotationViewProtocol)]) {
        [((NSObject<JPSThumbnailAnnotationViewProtocol> *)view) didSelectAnnotationViewInMap:mapView];
    }
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if ([view conformsToProtocol:@protocol(JPSThumbnailAnnotationViewProtocol)]) {
        [((NSObject<JPSThumbnailAnnotationViewProtocol> *)view) didDeselectAnnotationViewInMap:mapView];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation conformsToProtocol:@protocol(JPSThumbnailAnnotationProtocol)]) {
        return [((NSObject<JPSThumbnailAnnotationProtocol> *)annotation) annotationViewInMap:mapView];
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
