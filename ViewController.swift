//
//  ViewController.swift
//
//  Created by Ahmet Kamis on 11/04/18.
//  Copyright © 2018 Ahmet Kamis. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController : UIViewController, GADInterstitialDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showInterstitial () {
        
        //create request
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID] //you can add your deviceID
        
        //create ad with
        let interstitial = GADInterstitial(adUnitID: "YOUR_APP_UNIT_ID")
        interstitial.delegate = self
        interstitial.load(request)
        
        //that will go until ad gets ready! 
        var count = 0;
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (Timer) in                                                         
            count += 1
            //ad is ready
            if (interstitial.isReady) {
                //invalidate the timer.
                Timer.invalidate() 
                //show the ad
                interstitial.present(fromRootViewController: self)
            }
            //stop it if hits 30 seconds.
            if (count == 30) {
                Timer.invalidate()
            }  
        })
        
        return
    }  
}
