//
//  ContentView.swift
//  ChatGPT API
//
//  Created by giovanni russo on 01/03/23.
//


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var network: Network
    
    var initResponse: TranslationResponse = TranslationResponse(id: "id", object: "object", created: 1, choices: [TranslationResponse.TextCompletionChoice(index: 0, message: Messages(role: "", content: ""), finish_reason: "Stop")])
    
    var body: some View {
        VStack {
            Text("Assistant: "+network.response.resultText)
                .onAppear(){
                    network.prompt = "Hello my friend how are you?"

                    network.getResponse()
                }
        }
        .padding()
    }
}



