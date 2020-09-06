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

enum CatType {
    case art
    case park
    case musuem
}

class Places: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var price: String?
    var catigory: String
//    var type: CatType
//    var lattitude: CLLocationDegrees
//    var longtitude: CLLocationDegrees

   init(
      title: String,
      subtitle: String,
      catigory: String,
      price: String,
      coordinate: CLLocationCoordinate2D
//      type: CatType
    ) {

      self.price = price
      self.subtitle = subtitle

      self.catigory = catigory
      self.title = title
      self.coordinate = coordinate
    
      super.init()
  
    }
    var markerTintColor: UIColor  {
       switch catigory {
              case "park":
                return .green
              case "art":
                return .black
              case "musuem":
                 return .blue
              case "etc":
                 return .purple
              default:
                 return .yellow
       }
     }
}
