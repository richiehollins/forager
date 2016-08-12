//
//  Common.swift
//  Forager
//
//  Created by Hollins, Richie on 5/12/16.
//  Copyright © 2016 Hollins, Richie. All rights reserved.
//

import Foundation
import UIKit

func CGAffineTransformMakeDegreeRotation(rotation: CGFloat) -> CGAffineTransform {
    return CGAffineTransformMakeRotation(rotation * CGFloat(M_PI / 180))
}

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
    let ratio = (r2Max - r2Min) / (r1Max - r1Min)
    return value * ratio + r2Min - r1Min * ratio
}

func determineLocation(lat: Double, long: Double) -> String {
    if ( (lat > 37.62 && lat < 37.641) && (long > -77.6808 && long < -77.6636) ) {
        detectedLocation = "West Creek"
    } else if ( (lat > 38.913 && lat < 38.916) && (long > -77.2219 && long < -77.2189) ) {
        detectedLocation = "Towers"
    } else if ( (lat > 38.923 && lat < 38.9254) && (long > -77.2148 && long < -77.21128) ) {
        detectedLocation = "McLean"
    } else {
        detectedLocation = "Choose Location"
        print("lat: \(lat) long: \(long)")
    }
    return detectedLocation
}
