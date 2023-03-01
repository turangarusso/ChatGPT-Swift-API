<h1 align="center">
  <br>


     _______  _______ _________
    (  ___  )(  ____ )\__   __/
    | (   ) || (    )|   ) (   
    | (___) || (____)|   | |   
    |  ___  ||  _____)   | |   
    | (   ) || (         | |   
    | )   ( || )      ___) (___
    |/     \||/       \_______/


                           
  <br>
 ChatGPT-Swift-API
  <br>
</h1>

<h4 align="center">A swift rest api for ChatGPT
.</h4>


<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>

![63aaf2cee4ecef17661a7974_OpenAI](https://user-images.githubusercontent.com/113531412/219901691-6eac92d2-457e-40d7-94c9-9886069ba4f3.jpg)


## Key Features

The OpenAI ChatGPT API can be applied to virtually any task that involves understanding or generating natural language or code.

* Create your personal AI
  - You need to create an accout on OpenAi and get an API key.
* Get response and store in a struct 
* Code adaptable to every need
  - Content generation
  - Summarization
  - Classification, categorization, and sentiment analysis
  - Data extraction
  - Translation
  - Many more!
* Integrated with swiftUI



## How To Use

You can build the project using Xcode. To get the Api key go to your account on https://beta.openai.com/account/api-keys and copy the key.

In this example i've used Davinci "gpt-3.5-turbo" model with chat completions, you can adapt the code, create your custom AI

Change the value with your OpenAi Api key

```swift
urlRequest.httpMethod = "POST"
        
urlRequest.addValue("Bearer YOUR-API-KEY", forHTTPHeaderField: "Authorization")
        
urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
```

You can change and add or remove all OpenAI parameters:

```swift
guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            fatalError("Missing URL")
        }
.        
.
.
let message = Messages(role: "user", content: prompt)
let requestData = RequestData(model: "gpt-3.5-turbo", messages: [message])
.
.
.
struct RequestData: Codable {
    var model: String
    var messages: [Messages]
    
}
struct Messages: Codable {
    let role: String
    let content: String
}
extension TranslationResponse {
    struct TextCompletionChoice: Decodable{
        var index: Int
        var message: Messages
        var finish_reason: String
    }
}
```
Please read the official OpenAi API Documentation: https://beta.openai.com/docs if you need more info !

In the view you can easy call the Api using:

```swift
  .onAppear {
          network.prompt = "Hello my friend how are you?"

          network.getResponse()
        }
```

To get response text in the view, you can use:

```swift
Text("Assistant: "+network.response.resultText)

```

The Struct must be declared with the same parameters of the API Response

If you change the Request parameters, the response may change, so you need to edit the struct!

```
struct TranslationResponse: Decodable {
    var id: String
    var object: String
    var created: Int
    var choices: [TextCompletionChoice]
    
    var resultText: String {
        choices.map(\.message.content).joined(separator: "\n")
    }
}

extension TranslationResponse {
    struct TextCompletionChoice: Decodable{
        var index: Int
        var message: Messages
        var finish_reason: String
    }
}

```

> **Note**

> You can found more information on: https://platform.openai.com/docs/api-reference/chat/create


## Credits

THIS IS NOT THE OFFICIAL API CODE

Russo Giovanni M.

OpenAI

For educational purposes

## License

MIT

---

