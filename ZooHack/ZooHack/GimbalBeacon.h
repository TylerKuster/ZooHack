//
//  GimbalBeacon.h
//  ZooHack
//
//  Created by Hussian Ali Al-Amri on 11/9/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "Beacon.h"

@interface GimbalBeacon : Beacon

@property (strong, nonatomic) NSString *beaconId;
@property (strong, nonatomic) NSString *name ;
@property (strong, nonatomic) NSString *uuid ;
@property (nonatomic) NSInteger rssi;
@property (nonatomic) NSInteger batteryLevel;

@end
