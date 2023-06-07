//
//  ipfsFileExplorerApp.swift
//  ipfsFileExplorer
//
//  Created by Debasish Nandi on 07/06/23.
//

import SwiftUI
import FileProvider
import os

class FileProvide {
    
    var identifier: NSFileProviderDomainIdentifier!
    var domain: NSFileProviderDomain!
    var providerConnection: ProviderConnection!
    
    init() {
    }
    
    func applicationDidFinishLaunching() {
        identifier = NSFileProviderDomainIdentifier(rawValue: "somerawvalueIdentifier")
        domain = NSFileProviderDomain(identifier: identifier, displayName: "Cydrive")

        os_log("application Started for FileProvider IPFS")
        NSFileProviderManager.add(domain) { error in
            print("Error : \(error)")
            guard let error = error else {
                return
            }

            NSLog(error.localizedDescription)
        }
        
        providerConnection = ProviderConnection(domain: domain)
        providerConnection.resume()
    }
}

@main
struct ipfsFileExplorerApp: App {
    var body: some Scene {
        var _: () = FileProvide().applicationDidFinishLaunching()
        
        WindowGroup {
            ContentView()
        }
    }
}
