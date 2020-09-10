//
//  buttonController.swift
//  boredinchicago
//
//  Created by Sarah Thompson on 9/9/20.
//  Copyright © 2020 SarahThompson. All rights reserved.
//
import UIKit
import Foundation

class buttonController: UIViewController{
    
   
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
    
}
