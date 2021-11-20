//
//  PhoneToWatchDataController.swift
//  AppWatchCommunication
//
//  Created by paige on 2021/11/21.
//

import WatchConnectivity

class PhoneToWatchDataController: NSObject, WCSessionDelegate, ObservableObject {
    
    @Published var messageFromWatch: String = ""
    @Published var replyFromWatch: String = ""
    
    var session: WCSession?
    
    func setupSession() {
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("Watch Activated!")
        default:
            print("Not able to talk to watch :(")
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("Now Inaactive :(")
    }

    func sessionDidDeactivate(_ session: WCSession) {
        print("Did Deactivate :(")
    }

    
    // When received data, send back json data
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        print("received message: \(message)")
        
        if let hello = message["hello"] as? String {
            DispatchQueue.main.async {
                self.messageFromWatch = hello
                replyHandler(["hello":"hello"])
            }
        }
        
        if let world = message["world"] as? String {
            DispatchQueue.main.async {
                self.messageFromWatch = world
            }
            replyHandler(["world":"world"])
        }

    }
    
    
    
    // send message
    func sendMessage(message: [String: String]) {
        session?.sendMessage(message) { (context) in
//            self.decodeContext(context: context)
            if let hello = context["hello"] as? String {
                DispatchQueue.main.async {
                    self.replyFromWatch = hello
                }
                
            }
            if let world = context["world"] as? String {
                DispatchQueue.main.async {
                    self.replyFromWatch = world
                }
            }
        } errorHandler: { (error) in
            print(error)
        }
    }
    
}
