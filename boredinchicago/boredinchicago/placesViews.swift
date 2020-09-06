////
////  placesViews.swift
////  boredinchicago
////
////  Created by Sarah Thompson on 9/5/20.
////  Copyright © 2020 SarahThompson. All rights reserved.
////
//
//import Foundation
//
//import MapKit
//
//class PlacesMarkerView: MKMarkerAnnotationView {
//  override var annotation: MKAnnotation? {
//    willSet {
//      // 1
//      guard let place = newValue as? Places else {
//        return
//      }
//
//      canShowCallout = true
//      calloutOffset = CGPoint(x: -5, y: 5)
//      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//
//      // 2
//
//        markerTintColor = place.markerTintColor
//
//      if let letter = place.catigory?.first {
//        glyphText = String(letter)
//      }
//    }
//  }
//}
