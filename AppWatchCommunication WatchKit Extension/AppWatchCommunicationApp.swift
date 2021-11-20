//
//  AppWatchCommunicationApp.swift
//  AppWatchCommunication WatchKit Extension
//
//  Created by paige on 2021/11/21.
//

import SwiftUI

@main
struct AppWatchCommunicationApp: App {
    
    @StateObject var watchToPhoneDataController = WatchToPhoneDataController()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(watchToPhoneDataController)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
