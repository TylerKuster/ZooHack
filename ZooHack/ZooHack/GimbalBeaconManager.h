//
//  GimbalBeaconManager.h
//  ZooHack
//
//  Created by Hussian Ali Al-Amri on 11/9/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "BeaconDelegate.h"
#import "GimbalBeacon.h"
#import <Gimbal/Gimbal.h>

@interface GimbalBeaconManager : NSObject <GMBLPlaceManagerDelegate,CBCentralManagerDelegate>

@property (weak, nonatomic) id<BeaconDelegate> beaconDelegate;
@property (strong, nonatomic) CBCentralManager *bluetoothManager;
@property (strong, nonatomic) NSMutableArray* beacons;
@property (strong, nonatomic) GimbalBeacon* nearest;

-(BOOL)start;
-(void)invokeBeacon:(NSString*)gimbalApiKey;
-(BOOL)stop;

@end
