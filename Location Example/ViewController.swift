//
//  ViewController.swift
//  Location Example
//
//  Created by Apple on 29/04/19.
//  Copyright © 2019 GoMobileLabs. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var lblDisplayLocation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
         if CLLocationManager.locationServicesEnabled() {
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: locValue.latitude, longitudeDelta: locValue.longitude))
//
//        self.map.setRegion(region, animated: true)
        
        
        lblDisplayLocation.text = "latitude = \(locValue.latitude) \n longitude = \(locValue.longitude)"
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(locValue.latitude, locValue.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
        
    }
}

