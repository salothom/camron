//
//  places.swift
//  boredinchicago
//
//  Created by Sarah Thompson on 9/5/20.
//  Copyright © 2020 SarahThompson. All rights reserved.
//


import Foundation
import MapKit
import Contacts

class Places: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var price: String?
    var catigory: String?
//    var lattitude: CLLocationDegrees
//    var longtitude: CLLocationDegrees

   init(
      title: String,
      subtitle: String,
      catigory: String,
      price: String,
      coordinate: CLLocationCoordinate2D
    ) {
      self.price = price
      self.subtitle = subtitle
    
      self.catigory = catigory
      self.title = title
      self.coordinate = coordinate
      super.init()
  
    }
}
