//
//  ContentView.swift
//  ChatApp_SwiftUI
//
//  Created by Rahul Gupta on 13/10/19.
//  Copyright © 2019 Rahul Gupta. All rights reserved.
//

import SwiftUI
struct ChatMessage : Hashable {
    var message:String
    var avator:String
    var color:Color
    var isMe : Bool = false
}
struct ContentView: View {
    @State var composeMessage : String = ""
    @EnvironmentObject var chatController : ChatController
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    var body: some View {
        VStack {
            List.init {
                ForEach(chatController.messages,id: \.self) { msg in
                    ChatRow.init(message: msg)
                }
            }
            HStack {
                TextField.init("Message...", text: $composeMessage).frame(minHeight:CGFloat(30))
                Button.init("Send", action: sendMessage).frame(minHeight:CGFloat(50)).padding()
            }
        }
    }
    func sendMessage() {
        chatController.sendMessage(ChatMessage.init(message: composeMessage, avator: "C", color: .green,isMe: true))
        composeMessage = ""
    }
}
struct ChatRow : View {
    var message : ChatMessage
    var body: some View {
        Group {
            if !message.isMe {
                HStack {
                    Text(message.avator)
                    Text(message.message)
                        .bold()
                        .padding(10)
                        .foregroundColor(.white)
                        .background(message.color)
                        .cornerRadius(10)
                }
            }
            else {
                HStack {
                    Spacer()
                    Text(message.message)
                        .bold()
                        .padding(10)
                        .foregroundColor(.white)
                        .background(message.color)
                        .cornerRadius(10)
                    Text(message.avator)
                }
            }
        }
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(ChatController())
    }
}
