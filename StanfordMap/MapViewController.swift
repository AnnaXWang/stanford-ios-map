//
//  MapViewController.swift
//  StanfordMap
//
//  Created by John YS on 5/12/15.
//  Copyright (c) 2015 Silicon Valley Insight. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    // Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // Instance variables
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        LocationManager.sharedInstance.subscribeToLocationUpdates(self, withBlock: { (location: CLLocation) -> Void in
            
            self.mapView.showsUserLocation = true
            let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000)
            self.mapView.setRegion(region, animated: true)
            
            // Annotations are custom views
            println("location = \(location)")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
