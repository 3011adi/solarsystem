//
//  PlanetDetailView.swift
//  solarsystem
//
//  Created by adi naik on 15/07/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct PlanetDetailView: View {
    let modelName: String
    
    var body: some View {
        Model3D(named: modelName, bundle: realityKitContentBundle)
    }
}

#Preview {
    PlanetDetailView(modelName: "Earth")
}
