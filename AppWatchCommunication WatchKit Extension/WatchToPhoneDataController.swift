//
//  WatchToPhoneDataController.swift
//  AppWatchCommunication WatchKit Extension
//
//  Created by paige on 2021/11/21.
//

import WatchConnectivity

class WatchToPhoneDataController: NSObject, WCSessionDelegate, ObservableObject {
        
    var session = WCSession.default
    @Published var replyMessage: String = ""
    @Published var messageFromPhone: String = ""
    
    override init() {
        super.init()
        
        session.delegate = self
        session.activate()
        
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("Watch Activated!")
            
        default:
            print("Not able to talk to watch :(")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("received application Context: \(message)")
        if let hello = message["hello"] as? String {
            DispatchQueue.main.async {
                self.messageFromPhone = hello
            }
            replyHandler(["hello": "hello"])
        }
        if let world = message["world"] as? String {
            DispatchQueue.main.async {
                self.messageFromPhone = world
            }
            replyHandler(["world": "world"])
        }
    }

    // send message
    func sendMessage(message: [String: String]) {
        session.sendMessage(message) { (context) in
//            self.decodeContext(context: context)
            if let hello = context["hello"] as? String {
                DispatchQueue.main.async {
                    self.replyMessage = hello
                }
                
            }
            if let world = context["world"] as? String {
                DispatchQueue.main.async {
                    self.replyMessage = world
                }
            }
        } errorHandler: { (error) in
            print(error)
        }
    }
}
