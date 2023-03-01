//
//  ChatGPT_APIApp.swift
//  ChatGPT API
//
//  Created by giovanni russo on 01/03/23.
//

import SwiftUI

@main
struct ChatGPT_APIApp: App {
    var initResponse: TranslationResponse = TranslationResponse(id: "id", object: "object", created: 1, choices: [TranslationResponse.TextCompletionChoice(index: 0, message: Messages(role: "", content: ""), finish_reason: "Stop")])
    var body: some Scene {
        WindowGroup {
            ContentView(network: Network(response: initResponse))
        }
    }
}
