//
//  ContentView.swift
//  ServerlessButton
//
//  Created by Marek Sadowski on 1/19/21.
//

import SwiftUI

//Apache OpenWhisk
import OpenWhisk

//JSON helper
import SwiftyJSON


struct ContentView: View {
    
    func callServerlessBackend() {
        
        // MARK: SERVERLESS SETUP
        //getting data from cloud (serverless)
        // Change to your whisk app key and secret.
        // copy it from the IBM Cloud Functions - iOS app - step 4:
        // https://cloud.ibm.com/functions/learn/ios-sdk
        let WhiskAppKey = "<your key>"
        let WhiskAppSecret = "<your secret>"
        
        // the URL for Whisk backend something like "https://openwhisk.ng.bluemix.net"
        let baseUrl: String? = "https://openwhisk.ng.bluemix.net"

        // Choice: specify components "serverless.swift@roboticsind.com_dev"
        let MyNamespace: String = "<your CF Namespace>"
        
        // Specify you package "webinar-202101"
        let MyPackage: String? = "<your package>"
        
        // The actions to invoke.
        let MyWhiskAction0: String = "helloworld"
        
        var MyActionParameters0: [String:AnyObject]? = nil
        let HasResult: Bool = true // true if the action returns a result
        var session: URLSession!
        
        //using a WhiskButton to setup the call to the Serverless MBaaS
        var whiskButton: WhiskButton!
        let whiskHelper = WhiskButton()
        
        
        // MARK: SERVERLESS CALL
        print("getting data from the cloud")
        
        // create custom session that allows self-signed certificates
        //let session = URLSession(configuration: URLSessionConfiguration.default, delegate: SelfSignedNetworkDelegate(), delegateQueue:OperationQueue.main)

        // create whisk credentials token
        let creds = WhiskCredentials(accessKey: WhiskAppKey,accessToken: WhiskAppSecret)
        
        //setup location
        //locationManager.delegate = self
        //locationManager.requestWhenInUseAuthorization()
        
        MyActionParameters0 = ["name":"Serverless Swift" as AnyObject]
        let whisk = Whisk(credentials: creds)
        do {
         try whisk.invokeAction(name: MyWhiskAction0, package: MyPackage, namespace: MyNamespace, parameters: MyActionParameters0 as AnyObject, hasResult: HasResult, callback: {(reply, error) -> Void in
             if let error = error {
                 //do something
                 print("Error invoking action \(error.localizedDescription)")
             } else if let reply = reply {
                
                let str = "\(reply)"
                print("reply: \(str)")
                if let result = reply["result"] as? [String:AnyObject] {
                    print("result: \(result) ")
                    self.state = "result: \(result)"
                }
                print("Action invoked!")
             }

        })
        } catch {
                   print("Error \(error)")
                   self.state = "ERROR: \(error)"
        }

        NSLog("end action")
    }
    
    // MARK: The Button in SwiftUI
    @State var state: String
    
    var body: some View {
        VStack {
            Button(action: {
                print("button tapped! -> run action here")
                callServerlessBackend()
                //self.state = "the results come here"
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
