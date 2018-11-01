// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

/// Estructura con los valores de una unidad de comportamiento dinámico (*UIDynamicItemBehavior*)
struct ValoresUnidadComportamientoDinamico: Unidable {
    
    // MARK: Propiedades del protocolo *Unidable*
    
    var permitirRotacion: Bool
    var resistenciaAngular: CGFloat
    var elasticidad: CGFloat
    var friccion: CGFloat
    
    // MARK: - Inicialización
    
    init(color: ColorBola, material: Material) {
        self.permitirRotacion = false
        if color == .naranjaLanzar {
            self.resistenciaAngular = 10000
        } else {
            self.resistenciaAngular = 100
        }
        switch material {
        case .madera:
            self.elasticidad = 0.5
            self.friccion = 0.5
        case .acero:
            self.elasticidad = 0.4
            self.friccion = 0.2
        case .plastico:
            self.elasticidad = 0.7
            self.friccion = 0.1
        case .piedra:
            self.elasticidad = 0.3
            self.friccion = 0.6
        case .esponja:
            self.elasticidad = 0.1
            self.friccion = 0.8
        }
    }
    
}
