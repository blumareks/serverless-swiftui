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
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
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
