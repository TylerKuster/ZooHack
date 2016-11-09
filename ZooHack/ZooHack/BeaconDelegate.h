//
//  BeaconDelegate.h
//  ZooHack
//
//  Created by Hussian Ali Al-Amri on 11/9/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <GLKit/GLKit.h>

@protocol BeaconDelegate <NSObject>

-(void) setLatestPoint:(GLKVector2)point;
-(void) setBluetoothStatus:(CBManagerState)bluetoothState;

@end
