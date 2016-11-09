//
//  GimbalBeaconManager.m
//  ZooHack
//
//  Created by Hussian Ali Al-Amri on 11/9/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import "GimbalBeaconManager.h"

@interface GimbalBeaconManager() {
    GMBLPlaceManager *placeManager;
    GMBLCommunicationManager *communicationManager;

}

@end

@implementation GimbalBeaconManager

-(BOOL)start {
    [Gimbal start];
    return [Gimbal isStarted];
}

-(void)invokeBeacon:(NSString *)gimbalApiKey {
    self.beacons = [NSMutableArray new];
    
    
    self.bluetoothManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:0] forKey:CBCentralManagerOptionShowPowerAlertKey]];
    
    [Gimbal setAPIKey:gimbalApiKey options:nil];
    
    placeManager = [GMBLPlaceManager new];
    placeManager.delegate = self;
    [GMBLPlaceManager startMonitoring];
    
    communicationManager = [GMBLCommunicationManager new];
    [GMBLCommunicationManager startReceivingCommunications];
    
}

-(BOOL)stop {
    [GMBLPlaceManager stopMonitoring];
    [GMBLCommunicationManager stopReceivingCommunications];
    [Gimbal stop];
    return ![Gimbal isStarted];
}

-(void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSString *stateString = nil;
    
    switch(self.bluetoothManager.state) {
        case CBManagerStateResetting: stateString = @"The connection with the system service was momentarily lost, update imminent.";
            break;
        case CBManagerStateUnsupported: stateString = @"The platform doesn't support Bluetooth Low Energy.";
            break;
        case CBManagerStateUnauthorized: stateString = @"The app is not authorized to use Bluetooth Low Energy."; break;
        case CBManagerStatePoweredOff: stateString = @"Bluetooth is currently powered off.";
        break;
        case CBManagerStatePoweredOn: stateString = @"Bluetooth is currently powered on and available to use."; break;
        default: stateString = @"State unknown, update imminent.";
            break;
    }
    
    CBManagerState cbManagerState = self.bluetoothManager.state;
    if(self.beaconDelegate) {
        if ([self.beaconDelegate respondsToSelector:@selector(setBluetoothStatus:)])
            [self.beaconDelegate setBluetoothStatus:cbManagerState];
    }
}

-(void)placeManager:(GMBLPlaceManager *)manager didReceiveBeaconSighting:(GMBLBeaconSighting *)sighting forVisits:(NSArray *)visits {
    NSLog(@"Sighting: %@", sighting);
    NSLog(@"Visits %@", visits);
    
    GMBLPlace* place = ((GMBLVisit*)visits[0]).place;
    GMBLAttributes* attribute = place.attributes;

    NSString *xStr = [attribute stringForKey:@"x"];
    float xFloat = [xStr floatValue];
    
    NSString *yStr = [attribute stringForKey:@"y"];
    float yFloat = [yStr floatValue];
    
    GLKVector2 coordinates = GLKVector2Make(xFloat, yFloat);
    Beacon* newBeacon = [Beacon new];
    newBeacon.coordinates = coordinates;
    
    if(self.nearest == nil) {
        self.nearest = newBeacon;
    } else {
        // compare self.nearest with newBeacon
        float diff = GLKVector2Distance(self.nearest.coordinates, newBeacon.coordinates);
        if(diff == 0.0f) {
            // it is the same beacon
        } else {
            // it is a different beacon or beacon has moved
        }
    }
}

@end
