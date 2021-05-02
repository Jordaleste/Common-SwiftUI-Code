//
//  AppTrackingManager.swift
//  CommonCode
//
//  Created by Charles Eison on 4/30/21.
//

import AppTrackingTransparency
import AdSupport

class AppTrackingManager {
    
    //NEWLY ADDED PERMISSIONS FOR iOS 14
    // Load instance of this class and call requestPermission() in AppDelegate 
    func requestPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    // Tracking authorization dialog was shown
                    // and we are authorized
                    print("Authorized")
                    
                    // Now that we are authorized we can get the IDFA
                    print(ASIdentifierManager.shared().advertisingIdentifier)
                case .denied:
                    // Tracking authorization dialog was
                    // shown and permission is denied
                    print("Denied")
                case .notDetermined:
                    // Tracking authorization dialog has not been shown
                    print("Not Determined")
                case .restricted:
                    print("Restricted")
                @unknown default:
                    print("Unknown")
                }
            }
        }
    }
}
