// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

extension UILabel {
    
    /**
     Añade un número entero al texto de la etiqueta.
     
     - parameters:
        - numero: valor entero.
     */
    func nuevaNumeracion(con numero: Int) {
        self.text = String(numero)
    }
    
}
