// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

extension Material {
    
    /**
     Devuelve el número para dividir con la velocidad de arrastre de la bola de lanzar. De esta forma, se calculará la magnitud de empuje de la bola.
     
     - returns:
     Número que servirá como divisor para calcular la magnitud de empuje.
     */
    func divisorVelocidadLanzamiento() -> CGFloat {
        switch self {
        case .acero:
            return 300.0
        case .esponja:
            return 35.0
        case .madera:
            return 100.0
        case .piedra:
            return 200.0
        case .plastico:
            return 60.0
        }
    }
    
}
