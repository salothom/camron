//
//  buttonController.swift
//  boredinchicago
//
//  Created by Sarah Thompson on 9/9/20.
//  Copyright © 2020 SarahThompson. All rights reserved.
//
import UIKit
import Foundation
import GoogleMobileAds

class buttonController: UIViewController, GADBannerViewDelegate{
    
   
    @IBAction func websiteClicked(_ sender: AnyObject) {
        let application = UIApplication.shared

        let webURL = URL(string: "https://www.boredinchicago.com/")!
        application.open(webURL)
    }
    
    
       @IBAction func InstaClick(_ sender: Any) {

            let appURL = URL(string: "instagram://user?username=bored_in_chicago")!
            let application = UIApplication.shared

            
            if application.canOpenURL(appURL){
                application.open(appURL)
            }else{
                let webURL = URL(string: "https://instagram.com/bored_in_chicago")!
                       application.open(webURL)
            }
       }
       
       @IBAction func TikTokClick(_ sender: Any) {
            let application = UIApplication.shared

            let webURL = URL(string: "https://www.tiktok.com/@bored_in_chicago?lang=en")!
            application.open(webURL)
               
    }
    
    var bannerView: GADBannerView!
    
     var adMobBannerView = GADBannerView()
//        let ADMOB_BANNER_UNIT_ID = "ca-app-pub-7285044513738234/4325348153"
        override func viewDidLoad() {
            super.viewDidLoad()
            print(":ds.fkhbdsfsdf")
            bannerView = GADBannerView()
            bannerView.adSize = kGADAdSizeSmartBannerPortrait
            bannerView.adUnitID = "ca-app-pub-7285044513738234/4325348153"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        }
    
  
    
}
