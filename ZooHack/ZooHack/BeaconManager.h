//
//  BeaconManager.h
//  ZooHack
//
//  Created by Hussian Ali Al-Amri on 11/9/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <Gimbal/Gimbal.h>
#import "BeaconDelegate.h"

@protocol BeaconManagerDelegate <NSObject>
-(void)updateLocation:(GLKVector2)point;
-(void)getBluetoothStatus:(CBManagerState)bluetoothState;
@end

@interface BeaconManager : NSObject <GMBLPlaceManagerDelegate, BeaconDelegate, CBCentralManagerDelegate>

@property (weak, nonatomic) id<BeaconManagerDelegate>delegate;

@end
