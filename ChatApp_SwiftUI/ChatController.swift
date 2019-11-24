//
//  ChatController.swift
//  ChatApp_SwiftUI
//
//  Created by Rahul Gupta on 13/10/19.
//  Copyright © 2019 Rahul Gupta. All rights reserved.
//

import SwiftUI
import Combine

class ChatController: ObservableObject {
    
    var didChange = PassthroughSubject<Void,Never>()
    
    @Published var messages : [ChatMessage] = [
        ChatMessage.init(message: "Hi Rahul", avator: "A", color: .red),
        ChatMessage.init(message: "Hi Naval", avator: "B", color: .blue)
    ]
    
    func sendMessage(_ chatMsg : ChatMessage) {
        messages.append(chatMsg)
        didChange.send(())
    }
}
