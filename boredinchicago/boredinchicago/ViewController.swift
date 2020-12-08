//
//  ViewController.swift
//  boredinchicago
//
//  Created by Sarah Thompson on 9/5/20.
//  Copyright © 2020 SarahThompson. All rights reserved.
//

import UIKit
import MapKit
import SwiftUI
import GoogleMobileAds
import CoreLocation



class ViewController: UIViewController, MKMapViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate, GADBannerViewDelegate
 {
    var bannerView: GADBannerView!

    var priceArray: [String] = [String]()
    let places =  PlaceAnnotations().placesA
    var catNum = 0;
    let locationManager:CLLocationManager = CLLocationManager()
    private var currentLocation: CLLocation?

    
    @IBOutlet weak var pricePicker: UIPickerView!
    @IBOutlet weak var mapView: MKMapView!

    //    let ADMOB_BANNER_UNIT_ID = "ca-app-pub-7285044513738234/4325348153"
        override func viewDidLoad() {
            super.viewDidLoad()
            setFilters()

            let initialLocation = CLLocation(latitude: 41.8781, longitude: -87.6298)
                
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            mapView.delegate = self
            mapView.centerToLocation(initialLocation)
            fetchStadiumsOnMap(places)
            bannerView = GADBannerView(adSize: kGADAdSizeBanner)
            addBannerViewToView(bannerView)
            bannerView.adUnitID = "ca-app-pub-3834987627454469/9276409003"
            
    //        ca-app-pub-7285044513738234/4325348153
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        }
    
    
    
    
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       if (annotation.isKind(of: MKUserLocation.self)){
            return nil
        }
        var annotationView = MKMarkerAnnotationView()
        let identifier = ""
        annotationView = MKMarkerAnnotationView(annotation: annotation
            , reuseIdentifier: "myPin")
        annotationView.markerTintColor = .black
        annotationView.glyphTintColor = .white
        annotationView.clusteringIdentifier = identifier
        annotationView.isDraggable = true
        annotationView.canShowCallout = true
        let deleteButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        deleteButton.frame.size.width = 44
        deleteButton.frame.size.height = 44

        for stadium in places {
            if(annotation.title! == stadium.title!){
                deleteButton.setImage(UIImage(named: stadium.linkpic), for: .normal)
            }
        }

        annotationView.leftCalloutAccessoryView = deleteButton
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.text = annotation.subtitle!
        label.font = UIFont.italicSystemFont(ofSize: 14.0)
        label.numberOfLines = 0
        annotationView.detailCalloutAccessoryView = label
        return annotationView
        }
    
   
   
    
     func mapView(
      _ mapView: MKMapView,
      annotationView view: MKAnnotationView,
      calloutAccessoryControlTapped control: UIControl
    ) {
        
        fetchlinkforclick(places, currentAnt: view.annotation!.title!!)
    }
    func fetchlinkforclick(_ stadiums: [Places], currentAnt: String)  {
        let application = UIApplication.shared
           for stadium in stadiums {
            if(currentAnt == stadium.title!){
                let webURL = URL(string: stadium.links)!
                application.open(webURL)

            }
        }
    }
    

    
    func setFilters(){
        if(pricePicker != nil){
        pricePicker.delegate = self
        pricePicker.dataSource = self
        }
        priceArray = ["all","Landmark/Activity", "Art","Bar","Food","Neighborhood","Park"]
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
            if((stadium.category == priceArray[catNum] || priceArray[catNum] == "all")){
                let annotations = MKPointAnnotation()
                annotations.title = stadium.title
                annotations.subtitle = stadium.subtitle
//                annotations. = stadium.links
    
                annotations.coordinate = stadium.coordinate
                annotations.accessibilityHint = stadium.category
                mapView.addAnnotation(annotations)
            }
        }
    }
    func addBannerViewToView(_ bannerView: GADBannerView) {
         bannerView.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(bannerView)
         view.addConstraints(
           [NSLayoutConstraint(item: bannerView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: bottomLayoutGuide,
                               attribute: .top,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: bannerView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0)
           ])
        }
       
       
       func adViewDidReceiveAd(_ bannerView: GADBannerView) {
         print("adViewDidReceiveAd")
         addBannerViewToView(bannerView)
       }

       /// Tells the delegate an ad request failed.
       func adView(_ bannerView: GADBannerView,
           didFailToReceiveAdWithError error: GADRequestError) {
         print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
           
       }

       /// Tells the delegate that a full-screen view will be presented in response
       /// to the user clicking on an ad.
       func adViewWillPresentScreen(_ bannerView: GADBannerView) {
         print("adViewWillPresentScreen")
       }

       /// Tells the delegate that the full-screen view will be dismissed.
       func adViewWillDismissScreen(_ bannerView: GADBannerView) {
         print("adViewWillDismissScreen")
       }

       /// Tells the delegate that the full-screen view has been dismissed.
       func adViewDidDismissScreen(_ bannerView: GADBannerView) {
         print("adViewDidDismissScreen")
       }

       /// Tells the delegate that a user click will open another app (such as
       /// the App Store), backgrounding the current app.
       func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
         print("adViewWillLeaveApplication")
       }

       
       
       override func didReceiveMemoryWarning() {
              super.didReceiveMemoryWarning()
              // Dispose of any resources that can be recreated.
          }
}


//init screen zoom
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 5500
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
      let button = UIButton(type: .detailDisclosure)
//      button.setImage(UIImage(named: "tik"), for: .normal)

      rightCalloutAccessoryView = button
      markerTintColor = artwork.markerTintColor
//      glyphImage = artwork.image
    }
  }
}

