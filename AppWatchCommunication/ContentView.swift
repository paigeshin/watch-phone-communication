//
//  ContentView.swift
//  AppWatchCommunication
//
//  Created by paige on 2021/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var phoneToWatchDataController: PhoneToWatchDataController
    
    var body: some View {
        VStack {
            Text("Message From Watch: \(phoneToWatchDataController.messageFromWatch)")
            Text("Reply From Watch: \(phoneToWatchDataController.replyFromWatch)")
            Button("Send Hello") {
                phoneToWatchDataController.sendMessage(message: ["hello":"hello"])
            }
            Button("Send World") {
                phoneToWatchDataController.sendMessage(message: ["world":"world"])
            }
        }
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
