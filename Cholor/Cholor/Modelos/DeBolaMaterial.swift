// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import Foundation

/// Estructura del material que compone una bola.
struct DeBolaMaterial: Materiable {
    
    // MARK: - Propiedades del protocolo *Materiable*
    var material: Material
    var nombre: String
    var peso: Double
    
    // MARK: - Inicialización
    
    init(_ material: Material) {
        self.material = material
        self.nombre = material.description
        switch material {
        case .madera:
            self.peso = 3
        case .acero:
            self.peso = 5
        case .plastico:
            self.peso = 2
        case .piedra:
            self.peso = 4
        case .esponja:
            self.peso = 1
        }
    }
    
}
