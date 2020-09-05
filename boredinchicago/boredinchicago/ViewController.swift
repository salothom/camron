//
//  ViewController.swift
//  boredinchicago
//
//  Created by Sarah Thompson on 9/5/20.
//  Copyright © 2020 SarahThompson. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
//    mapView.showsUserLocation = true
    
    //Startup location:
    
        struct Places {
             var name: String
             var descript: String
             var price: String
             var coordinate: CLLocationCoordinate2D
           }
 
    let places = [Places(name: "Lincoln Park", descript: "park", price: "free", coordinate: CLLocationCoordinate2D(latitude:  41.9255, longitude: -87.6488)),
                        Places(name: "Stamford Bridge", descript: "park", price: "$",  coordinate: CLLocationCoordinate2D(latitude:  41.9655,longitude: -87.6428)),
                        Places(name:"The Bean", descript: "bean",price: "free",coordinate: CLLocationCoordinate2D(latitude:41.8827, longitude: -87.6233)),
                        Places(name: "White Hart Lane", descript: "park", price: "free", coordinate: CLLocationCoordinate2D(latitude:  41.9215, longitude: -87.6188)),
                        Places(name: "Olympic Stadium", descript: "park", price: "$$$", coordinate: CLLocationCoordinate2D(latitude:  41.9225, longitude: -87.6458)),
                        Places(name: "Old Trafford", descript: "park", price: "$$", coordinate: CLLocationCoordinate2D(latitude:  41.9235, longitude: -87.6438)),
                        Places(name: "Anfield", descript: "park", price: "free", coordinate: CLLocationCoordinate2D(latitude:  41.9215, longitude: -87.6418))]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkLocationServices()
        let initialLocation = CLLocation(latitude: 41.8781, longitude: -87.6298)

        mapView.centerToLocation(initialLocation)
        fetchStadiumsOnMap(places)
    }
    
    ///Location Authorization of User
    let locationManager = CLLocationManager()
    
    func checkLocationServices() {
      if CLLocationManager.locationServicesEnabled() {
        checkLocationAuthorization()
      } else {
        // Show alert letting the user know they have to turn this on.
      }
    }
    
    func checkLocationAuthorization() {
      switch CLLocationManager.authorizationStatus() {
      case .authorizedWhenInUse:
        mapView.showsUserLocation = true
       case .denied: // Show alert telling users how to turn on permissions
       break
      case .notDetermined:
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
      case .restricted: // Show an alert letting them know what’s up
       break
      case .authorizedAlways:
       break
      }
    }
    
    
    func checkAuthorizationStatus() {
      switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse: break
        case .denied: break
        case .notDetermined: break
        case .restricted: break
        case .authorizedAlways: break
      }
    }

    
    //Places diaplayed!!!
    

    func fetchStadiumsOnMap(_ stadiums: [Places]) {
      for stadium in stadiums {
        let annotations = MKPointAnnotation()
        annotations.title = stadium.name
        annotations.coordinate = stadium.coordinate
        mapView.addAnnotation(annotations)
      }
    }
}


  //init screen zoom
  private extension MKMapView {
    func centerToLocation(
      _ location: CLLocation,
      regionRadius: CLLocationDistance = 15000
    ) {
      let coordinateRegion = MKCoordinateRegion(
        center: location.coordinate,
        latitudinalMeters: regionRadius,
        longitudinalMeters: regionRadius)
      setRegion(coordinateRegion, animated: true)
    }
  }


//notes and help //https://www.iosapptemplates.com/blog/swift-programming/mapkit-tutorial
//https://www.raywenderlich.com/7738344-mapkit-tutorial-getting-started#toc-anchor-002


