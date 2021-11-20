//
//  AppWatchCommunicationApp.swift
//  AppWatchCommunication
//
//  Created by paige on 2021/11/21.
//

import SwiftUI

@main
struct AppWatchCommunicationApp: App {
    
    @StateObject var phoneToWatchDataController = PhoneToWatchDataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(phoneToWatchDataController)
                .onAppear {
                    phoneToWatchDataController.setupSession()
                }
        }
    }
}
