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
import FirebaseAuth

class FirstViewController: UIViewController,CLLocationManagerDelegate{
    @IBOutlet weak var mapa: MKMapView!
    private let locationManager = CLLocationManager()
    var handle: AuthStateDidChangeListenerHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapa.showsUserLocation = true
        createAnnotations(locations: annotationLocations)
        
        if CLLocationManager.locationServicesEnabled() == true {
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied ||
                CLLocationManager.authorizationStatus() == .notDetermined {
                
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            handle = Auth.auth().addStateDidChangeListener { (auth, user) in
              // ...
            }

        } else {
            print("Please turn on location services or GPS")
    }
}
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        self.mapa.setRegion(region, animated: true)
    }
    func locationManager(_manager: CLLocationManager, didFailWithError error: Error){
        print("Unable to access your current location")
    }
    
    let annotationLocations = [
        ["title":"Krispy Kreme", "latitude": 19.3056727, "longitude": -99.1659538],
        ["title":"Tacos Charly", "latitude": 19.2933369, "longitude": -99.16996],
        ["title":"Sushi Roll", "latitude": 19.3054303, "longitude": -99.2025131],
        ["title":"Santa Clara", "latitude": 19.286792, "longitude": -99.163281],
        ["title":"Wingstop", "latitude": 19.2963143, "longitude": -99.15926]
    ]
    
    func createAnnotations(locations: [[String : Any]]){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        mapa.mapType=MKMapType.standard
        for location in locations{
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            
             mapa.addAnnotation(annotations)
            mapa.showsCompass=true
            mapa.showsScale=true
            mapa.showsTraffic=true
            mapa.isZoomEnabled=true
        }
      
        //let span=MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        //mapa.region=MKCoordinateRegion(center: cl, span: span)
       
        //mapa.addAnnotation(rest1)
        /*mapa.showsCompass=true
        mapa.showsScale=true
        mapa.showsTraffic=true
        mapa.isZoomEnabled=true*/
        
        
    }

    /*func locationManager(_ manager: CLLocationManager,
                          didUpdateLocations locations: [CLLocation]) {
        
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

