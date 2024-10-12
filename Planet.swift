//
//  Planets.swift
//  solarsystem
//
//  Created by adi naik on 15/07/24.
//

import Foundation

struct Planet: Identifiable {
    var name: String
    var modelName: String
    var description: String
    var id = UUID()
}

