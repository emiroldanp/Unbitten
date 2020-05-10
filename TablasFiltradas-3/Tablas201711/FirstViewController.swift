//
//  FirstViewController.swift
//  Tablas201711
//
//  Created by molina on 20/02/17.
//  Copyright © 2017 Tec de Monterrey. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController,CLLocationManagerDelegate{
    @IBOutlet weak var mapa: MKMapView!
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createAnnotations(locations: annotationLocations)
    }
    let annotationLocations = [
        ["title":"Krispy Kreme", "latitude": 19.3056727, "longitude": -99.1659538],
        ["title":"Tacos Charly", "latitude": 19.2933369, "longitude": -99.16996],
        ["title":"Sushi Roll", "latitude": 19.3054303, "longitude": -99.2025131],
        ["title":"Santa Clara", "latitude": 19.286792, "longitude": -99.163281],
        ["title":"Wingstop", "latitude": 19.2963143, "longitude": -99.15926]
    ]
    
    func createAnnotations(locations: [[String : Any]]){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
        mapa.mapType=MKMapType.standard
        for location in locations{
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            
             mapa.addAnnotation(annotations)
        }
      
        //let span=MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        //mapa.region=MKCoordinateRegion(center: cl, span: span)
       
        //mapa.addAnnotation(rest1)
        mapa.showsCompass=true
        mapa.showsScale=true
        mapa.showsTraffic=true
        mapa.isZoomEnabled=true
        
        
    }

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
            mapa.showsUserLocation = true
        } else {
            locationManager.stopUpdatingLocation()
            mapa.showsUserLocation = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

