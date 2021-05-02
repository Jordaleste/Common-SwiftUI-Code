//
//  ContentView.swift
//  CommonCode
//
//  Created by Charles Eison on 4/30/21.
//

import SwiftUI

// Showing multiple alerts from one view. Tied to AlertView.
struct ContentView: View {
    
    // our binding variable for our alert. When this changes via our button presses, our .alert is triggered.
    @State private var alertItem: AlertItem?
    
    var body: some View {
        VStack {
            Button("Show Alert1") {
                // present alert from AlertView
                alertItem = AlertContext.caseOne
            }
            
            Button("Show Alert2") {
                // present alert from AlertView
                alertItem = AlertContext.caseTwo
            }
            
            Button("Show Alert3") {
                // present alert from AlertView
                alertItem = AlertContext.caseThree
            }
        }
        // Show correct alert from 3 options. We use .alert(item, content)
        .alert(item: $alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: .default(alertItem.buttonTitle, action: {
                // Code dismiss action here
            }))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
