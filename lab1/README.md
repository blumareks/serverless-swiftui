# Lab 1 - a simple SwiftUI app

Start by creating an app project in XCode using SwiftUI.

Change the default code in `ContentView.swift` to this one:

```swift
//
//  ContentView.swift
//  ServerlessButton
//
//  Created by Marek Sadowski on 1/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var state: String
    
    var body: some View {
        VStack {
            Button(action: {
                print("button tapped! -> run action here")
                self.state = "the results come here"
            }, label: {
                HStack {
                    
                Image(systemName: "touchid")
                    .font(.title)
                Text("Button")
                    .fontWeight(.semibold)
                    .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(40)
            })
            Text(state)
                .padding()
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: "here will be some result")
    }
}
```

Also please pass the initial `state` when calling the `ContentView` from `ServerlessButtonApp.swift`
```swift
//
//  ServerlessButtonApp.swift
//  ServerlessButton
//
//  Created by Marek Sadowski on 1/19/21.
//

import SwiftUI

@main
struct ServerlessButtonApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(state: "")
        }
    }
}
```

Try your app with an iPhone12 simulator 
