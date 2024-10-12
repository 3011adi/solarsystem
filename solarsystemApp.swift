//
//  solarsystemApp.swift
//  solarsystem
//
//  Created by adi naik on 15/07/24.
//

import SwiftUI

@main
struct solarsystemApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        WindowGroup(id: "planetWindow", for: String.self) { $modelName in
            PlanetDetailView(modelName: modelName ?? "Earth")
            
        }
        .windowStyle(.volumetric)
                .defaultSize(width: 0.5, height: 0.5, depth: 0.5, in: .meters)
    }
}
