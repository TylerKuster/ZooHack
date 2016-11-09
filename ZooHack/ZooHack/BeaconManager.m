//
//  BeaconManager.m
//  ZooHack
//
//  Created by Hussian Ali Al-Amri on 11/9/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import "BeaconManager.h"

@implementation BeaconManager

-(void)setLatestPoint:(GLKVector2)point {
    NSLog(@"Latest point x: %f, y: %f", point.x, point.y);
    if([self.delegate respondsToSelector:@selector(updateLocation:)]) {
        [self.delegate updateLocation:point];
    }
}

-(void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSLog(@"%ld", (long)central.state);
}

-(void)setBluetoothStatus:(CBManagerState)bluetoothState {
    if ([self.delegate respondsToSelector:@selector(getBluetoothStatus:)]) {
        [self.delegate getBluetoothStatus:bluetoothState];
    }
}

@end
