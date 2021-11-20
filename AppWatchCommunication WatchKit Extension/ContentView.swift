//
//  ContentView.swift
//  AppWatchCommunication WatchKit Extension
//
//  Created by paige on 2021/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var watchToPhoneDataController: WatchToPhoneDataController
    
    var body: some View {
        VStack {
            Text("Message From Phone: \(watchToPhoneDataController.messageFromPhone)")
            Text("Reply From Phone: \(watchToPhoneDataController.replyMessage)")
            Button("Send Hello") {
                watchToPhoneDataController.sendMessage(message: ["hello": "hello"])
            }
            Button("Send World") {
                watchToPhoneDataController.sendMessage(message: ["world": "world"])
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
