//
//  ContentView.swift
//  solarsystem
//
//  Created by adi naik on 15/07/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    @State private var selectedPlanet: Planet?
    private var Planets = [
           Planet(name: "Earth", modelName: "Earth", description: "Our home planet, the third from the Sun. Earth is the third planet from the Sun and the only astronomical object known to harbor life. About 29.2% of Earth's surface is land with remaining 70.8% covered with water. Earth's distance from the Sun, physical properties and geological history have allowed life to evolve and thrive."),
           Planet(name: "Mercury", modelName: "Mercury", description: "The smallest planet in our solar system and closest to the Sun. Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun's planets. It is named after the Roman god Mercury, the messenger of the gods."),
           Planet(name: "Mars", modelName: "Mars", description: "The red planet, known for its iron oxide dust. Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries a name of the Roman god of war and is often referred to as the 'Red Planet'."),
           Planet(name: "Moon", modelName: "Moon", description: "Earth's only natural satellite. The Moon is Earth's only natural satellite and is the fifth largest satellite in the Solar System. It is the largest natural satellite in the Solar System relative to the size of its planet. The Moon is thought to have formed about 4.51 billion years ago."),
           Planet(name: "Jupiter", modelName: "Jupiter", description: "The largest planet in our solar system. Jupiter is the largest planet in the Solar System and is known for its prominent storm, the Great Red Spot. Jupiter is primarily composed of hydrogen with a quarter of its mass being helium."),
           Planet(name: "Neptune", modelName: "Neptune", description: "The farthest planet from the Sun in our solar system. Neptune is the eighth and farthest-known Solar planet from the Sun. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet."),
           Planet(name: "Saturn", modelName: "Saturn", description: "Known for its stunning ring system. Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine and a half times that of Earth. It only has one-eighth the average density of Earth."),
           Planet(name: "Sun", modelName: "Sun", description: "The star at the center of our solar system. The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma, with internal convective motion that generates a magnetic field via a dynamo process."),
           Planet(name: "Pluto", modelName: "Pluto", description: "A dwarf planet in the Kuiper belt. Pluto is a dwarf planet in the Kuiper belt, a ring of bodies beyond Neptune. It was the first Kuiper belt object to be discovered and is the largest known plutoid. Pluto is primarily made of ice and rock."),
           Planet(name: "Uranus", modelName: "Uranus", description: "Known for its unique sideways rotation. Uranus is the seventh planet from the Sun. Its name is a reference to the Greek god of the sky, Uranus. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System."),
           Planet(name: "Venus", modelName: "Venus", description: "The second planet from the Sun, known for its thick, toxic atmosphere. Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the brightest natural object in Earth's night sky after the Moon, Venus can cast shadows and is, on rare occasion, visible to the naked eye in broad daylight.")
       ]
    
    var body: some View {
            NavigationSplitView {
                List(Planets) { planet in
                                Button(action: {
                                    selectedPlanet=planet
                                }, label: {
                                    Text(planet.name)
                                        
                                })
                            }
                .navigationTitle("Solar system")
            } detail: {
                if let selectedPlanet {
                    Model3D(named: selectedPlanet.modelName, bundle: realityKitContentBundle)
                                       .navigationTitle(selectedPlanet.name)
                   
                    Text(selectedPlanet.description)
                        .font(.title2)
                        .padding(.all, 30)
                       
                    .toolbar {
                    Button(action: {
                        openWindow(id: "planetWindow", value: selectedPlanet.modelName)
                                     },
                    label: {
                    Text("View \(selectedPlanet.name)")})
                    }
                } else {
                               Text("Select a item")
                           }
            }
        }
    }

#Preview(windowStyle: .automatic) {
    ContentView()
}
