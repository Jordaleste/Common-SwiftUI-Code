//
//  AlertView.swift
//  CommonCode
//
//  Created by Charles Eison on 5/2/21.
//

import SwiftUI

// Must conform to identifiable to use .alert(item, content)
// In ContentView, we create an optional one of these to track for changes (our binding variable)
struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    // Note: must be static variables so they are global or we get errors
    
    static let caseOne = AlertItem(title: Text("Title goes here"),
                            message: Text("Message goes here"),
                            buttonTitle: Text("Button Text goes here"))
    
    static let caseTwo = AlertItem(title: Text("Another title goes here"),
                            message: Text("Another message goes here"),
                            buttonTitle: Text("Another button text goes here"))
    
    static let caseThree = AlertItem(title: Text("Yet another title goes here"),
                            message: Text("Yet another message goes here"),
                            buttonTitle: Text("Yet another button text goes here"))
}

// For use case, see ContentView


