//
//  AskForReview.swift
//  CommonCode
//
//  Created by Charles Eison on 4/30/21.
//

import Foundation
import StoreKit

class AskForReview {
    
    // App Review Request Count
    // Note: Create if needed the variable tracked / required to trigger review request as follows:
    var numberOfTimesSavedPressed = UserDefaults.standard.integer(forKey: "numberOfTimesSavedPressed")
    let defaults = UserDefaults.standard
    let bundle = Bundle.main
    
    
    func requestReview() {
        
        //Keeping up with number of times save is pressed for App review request
        numberOfTimesSavedPressed += 1
        defaults.set(numberOfTimesSavedPressed, forKey: "numberOfTimesSavedPressed")
        
//        if numberOfTimesSavedPressed > 20 {
//            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//                SKStoreReviewController.requestReview(in: scene)
//        }
        // Below code will only call the app review request if the numberOfTimesPressed > 20 && the user has not been prompted on the current version number. Here for reference and to implement for better practice if wanted. If using, comment out the above if statement.
            
            
//        // Get the current bundle version for the app
        let infoDictionaryKey = kCFBundleVersionKey as String
        guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: infoDictionaryKey) as? String
        else { fatalError("Expected to find a bundle version in the info dictionary") }

        let lastVersion = defaults.string(forKey: "lastReviewRequestVersion")


        //Asking for app review after user has saved at least 20 times
        if numberOfTimesSavedPressed > 2 && currentVersion != lastVersion {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
                //update last version to current version to assure user is only prompted once per version. Resetting times pressed back to 0
                defaults.set(currentVersion, forKey: "lastReviewRequestVersion")
                defaults.set(0, forKey: "numberOfTimesSavedPressed")
            }
        }
    }
}
