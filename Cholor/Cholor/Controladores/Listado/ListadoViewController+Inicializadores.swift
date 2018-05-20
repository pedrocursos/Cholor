// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import Foundation

// Inicializadores

extension ListadoViewController {
    
    /**
     Crea la información sobre los tipos de  bolas.
     */
    func iniciarBolas() {
        self.bolas = [
            DeBolaMaterial(.madera),
            DeBolaMaterial(.acero),
            DeBolaMaterial(.plastico),
            DeBolaMaterial(.piedra),
            DeBolaMaterial(.esponja)
        ]
    }
    
}
