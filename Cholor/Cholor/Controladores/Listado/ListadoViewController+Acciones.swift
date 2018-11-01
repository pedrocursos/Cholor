// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit
import Hero

// Acciones

extension ListadoViewController {
    
    /**
     Vuelve a la pantalla anterior.
     
     - parameters:
        - sender: el botón de volver.
     */
    @IBAction func volverPulsado(_ sender: UIButton) {
        self.hero.dismissViewController()
    }
    
}
