//
//  places.swift
//  boredinchicago
//
//  Created by Sarah Thompson on 9/5/20.
//  Copyright © 2020 SarahThompson. All rights reserved.
//

import Foundation
import MapKit

class Places: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var name: String
    var descript: String
    var price: String
//    var lattitude: CLLocationDegrees
//    var longtitude: CLLocationDegrees

  init(
    name: String,
    descript: String,
    price: String,
    coordinate: CLLocationCoordinate2D
  ) {
    self.price = price
    self.descript = descript
    self.name = name
    self.coordinate = coordinate

    super.init()
  }

  var subtitle: String? {
    return name
  }
    
   
}
