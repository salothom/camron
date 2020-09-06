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
    
    var priceArray: [[String]] = [[String]]()

    @IBOutlet weak var pricePicker: UIPickerView!
    @IBOutlet weak var mapView: MKMapView!

    
    var priceNum = 0;
    var catNum = 0;
   
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
               var annotationView = MKMarkerAnnotationView()
//               var annotationn = annotation as? Places
//        guard let annotation = annotation as? Places else {
//          return nil
//        }
       

        let identifier = ""
//        switch annotation. {
//                                case "park":
//                                  color = .red
//                                case "art":
//                                  color = .black
//                                case "musuem":
//                                   color = .blue
//                                case "etc":
//                                   color = .purple
//                                default:
//                                   color = .yellow
//                         }
                      
                 annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
               annotationView.glyphTintColor = .black
               annotationView.clusteringIdentifier = identifier
            
//            print(color)

               return annotationView
           }
    
    func setFilters(){
        pricePicker.delegate = self
        pricePicker.dataSource = self
        priceArray = [["all","free","$","$$","$$$","$$$$"],["all","parks", "art","musuem","restuarant","sports"]]
    }
    
    


    
    
 
    let places = [Places(title: "Lincoln Park", subtitle: "plsdkmark", catigory: "park",price: "free", coordinate: CLLocationCoordinate2D(latitude:  41.9255, longitude: -87.6488)),
        Places(title: "Stamford Bridge", subtitle: "paldksfmrk",  catigory: "park", price: "$",  coordinate: CLLocationCoordinate2D(latitude:  41.9655,longitude: -87.6428)),
        Places(title:"The Bean", subtitle: "bean",  catigory: "art", price: "free",coordinate: CLLocationCoordinate2D(latitude:41.8827, longitude: -87.6233)),
        Places(title:"The Monkey", subtitle: "bean",  catigory: "art", price: "free",coordinate: CLLocationCoordinate2D(latitude:41.8727, longitude: -87.6733)),
        Places(title:"The TREE", subtitle: "bean",  catigory: "art", price: "$$",coordinate: CLLocationCoordinate2D(latitude:41.9827, longitude: -87.6533)),
        Places(title: "White Hart Lane", subtitle: "parlsdnjfk",  catigory: "art", price: "free", coordinate: CLLocationCoordinate2D(latitude:  41.9215, longitude: -87.6188)),
        Places(title: "Olympic Stadium", subtitle: "pdlskfmark",  catigory: "musuem", price: "$$$", coordinate: CLLocationCoordinate2D(latitude:  41.9225, longitude: -87.6458)),
        Places(title: "Old Trafford", subtitle: "parlsdjknfk",  catigory: "art", price: "$$", coordinate: CLLocationCoordinate2D(latitude:  41.9235, longitude: -87.6438)),
        Places(title: "Anfield", subtitle: "pasdljkfrk", catigory: "musuem", price: "free", coordinate: CLLocationCoordinate2D(latitude:  41.9215, longitude: -87.6418))
    
    ]

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        setFilters()
        // Do any additional setup after loading the view.
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
//      @unknown default:
//        <#fatalError()#>
        }
    }
    
    
    func checkAuthorizationStatus() {
      switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse: break
        case .denied: break
        case .notDetermined: break
        case .restricted: break
        case .authorizedAlways: break
//      @unknown default:
//        <#fatalError()#>
        }
    }
    
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 2
       }
         
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return priceArray[1].count
       }
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                if(component == 0){
                    priceNum = row;
                }
                if(component == 1){
                    catNum = row;
                }
                updateAnnotations()
             }
        
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return priceArray[component][row]
       }
    
    //Places diaplayed!!!
    func updateAnnotations(){
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        fetchStadiumsOnMap(places)
    }

    
   
    
    
    
    
    
    
    func fetchStadiumsOnMap(_ stadiums: [Places])  {
//        var annotationView = MKMarkerAnnotationView()
//        let identifier = ""
//        annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        
        for stadium in stadiums {
        print(stadium.catigory, "HI")
        if((stadium.price == priceArray[0][priceNum] || priceArray[0][priceNum] == "all")&&(stadium.catigory == priceArray[1][catNum] || priceArray[1][catNum] == "all")){
            
//            annotationView.markerTintColor = stadium.markerTintColor
            
            let annotations = MKPointAnnotation()
            annotations.title = stadium.title
            annotations.subtitle = stadium.subtitle
            annotations.coordinate = stadium.coordinate
            annotations.accessibilityHint = stadium.catigory
//            annotations. = stadium.price
            
    //        annotations. = stadium.markerTintColor
            
            mapView.addAnnotation(annotations)
        }
        }
//         return annotationView
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
        print("hi")
      guard let annotation = newValue as? Places else {
        return
      }
        var color = UIColor.systemPink

        switch annotation.accessibilityHint {
                                     case "park":
                                       color = .red
                                     case "art":
                                       color = .black
                                     case "musuem":
                                        color = .blue
                                     case "etc":
                                        color = .purple
                                     default:
                                        color = .yellow
                              }
        print("NO")
      canShowCallout = true
      calloutOffset = CGPoint(x: -5, y: 5)
      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

      // 2
      markerTintColor = color
//      glyphImage = artwork.image
    }
  }
}
