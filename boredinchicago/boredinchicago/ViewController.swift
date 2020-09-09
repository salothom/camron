//
//  ViewController.swift
//  boredinchicago
//
//  Created by Sarah Thompson on 9/5/20.
//  Copyright © 2020 SarahThompson. All rights reserved.
//

import UIKit
import MapKit



class ViewController: UIViewController, MKMapViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var priceArray: [String] = [String]()
    let places =  PlaceAnnotations().placesA

    @IBAction func topclick(_ sender: UIButton) {
         print("papapap")
    }
    @IBAction func websiteClicked(_ sender: AnyObject) {
        print("papapap")

    }
    
    @IBAction func InstaClick(_ sender: UIImage) {
        
                let appURL = URL(string: "instagram://user?username=bored_in_chicago")!
                let application = UIApplication.shared
                
                if application.canOpenURL(appURL)
                {
                    application.open(appURL)
                }
                else
                {
                    let webURL = URL(string: "https://instagram.com/bored_in_chicago")!
                    application.open(webURL)
                }
        
    }
    
    @IBAction func TikTokClick(_ sender: Any) {
        print("dklsajfb")
    }
    
    
    
    @IBOutlet weak var websiteButton: UIImageView!
    @IBOutlet weak var instaButton: UIImageView!
    @IBOutlet weak var tiktokButton: UIImageView!
    
    @IBOutlet weak var pricePicker: UIPickerView!
    @IBOutlet weak var mapView: MKMapView!

    
//    var priceNum = 0;
    var catNum = 0;
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = MKMarkerAnnotationView()
        let identifier = ""
        annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
        annotationView.markerTintColor = .black
        annotationView.glyphTintColor = .white
        annotationView.clusteringIdentifier = identifier
        annotationView.isDraggable = true
        annotationView.canShowCallout = true
//        annotationView.frame = CGRect(x: 0, y: 0, width: 40, height: 550)
        
//        annotationView.rightCalloutAccessoryView =
//
        let deleteButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        deleteButton.frame.size.width = 44
        deleteButton.frame.size.height = 44
        
        deleteButton.backgroundColor = .systemPink
        annotationView.leftCalloutAccessoryView = deleteButton
        return annotationView
        }
    

    
    func setFilters(){
        pricePicker.delegate = self
        pricePicker.dataSource = self
        priceArray = ["all","Landmark/Activity", "Art","Food","Park"]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setFilters()
        checkLocationServices()
        let initialLocation = CLLocation(latitude: 41.8781, longitude: -87.6298)
        
        mapView.delegate = self
        mapView.centerToLocation(initialLocation)
         
        fetchStadiumsOnMap(places)
    }
    
    
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
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
    
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
         
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return priceArray.count
       }
       
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                catNum = row;
                updateAnnotations()
             }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return priceArray[row]
       }
    
    //Places diaplayed!!!
    func updateAnnotations(){
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        fetchStadiumsOnMap(places)
    }

    

    func fetchStadiumsOnMap(_ stadiums: [Places])  {
        for stadium in stadiums {
            if((stadium.catigory == priceArray[catNum] || priceArray[catNum] == "all")){
                let annotations = MKPointAnnotation()
                annotations.title = stadium.title
                annotations.subtitle = stadium.subtitle
                annotations.coordinate = stadium.coordinate
                annotations.accessibilityHint = stadium.catigory
                mapView.addAnnotation(annotations)
            }
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



class ArtworkMarkerView: MKMarkerAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      // 1
      guard let artwork = newValue as? Places else {
        return
      }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

      // 2
      markerTintColor = artwork.markerTintColor
//      glyphImage = artwork.image
    }
  }
}

class ArtworkView: MKAnnotationView {
  override var annotation: MKAnnotation? {
    willSet {
      guard let artwork = newValue as? Places else {
        return
      }
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 48, height: 48)))
      mapsButton.setBackgroundImage(#imageLiteral(resourceName: "Map"), for: .normal)
      rightCalloutAccessoryView = mapsButton

//      image = artwork.image
      
      let detailLabel = UILabel()
      detailLabel.numberOfLines = 0
      detailLabel.font = detailLabel.font.withSize(12)
      detailLabel.text = artwork.subtitle
      detailCalloutAccessoryView = detailLabel
    }
  }
}
