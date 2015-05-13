//
//  LocationManager.swift
//  StanfordMap
//
//  Created by John YS on 5/12/15.
//  Copyright (c) 2015 Silicon Valley Insight. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    // Singleton class
    // Class variable called shared instance that is lazily instaniated by swift - all class variables are lazily instaniated by swift
    static let sharedInstance = LocationManager()
    
    let locationManager = CLLocationManager()
    
    override init() {
        // In Swift - initialize your own stuff beforey you call super
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // Call super.init()
        super.init()
        
        // Setting self afterwards because full init must happen first
        locationManager.delegate = self
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        let location = locations.last as! CLLocation
        
        // userInfo has the custom information that you want to send
        NSNotificationCenter.defaultCenter().postNotificationName("LocationUpdateNotification", object: nil, userInfo: ["location": location])
    }
    
    func subscribeToLocationUpdates(observer: AnyObject, withBlock block:(CLLocation) -> Void) {
        
        NSNotificationCenter.defaultCenter().addObserverForName("LocationUpdateNotification", object: nil, queue: NSOperationQueue.mainQueue()) { (notification: NSNotification!) -> Void in
            let location = notification.userInfo?["location"] as! CLLocation
            block(location)
        }
    }
}