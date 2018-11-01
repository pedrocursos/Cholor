// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

extension JuegoViewController {
    
    /**
     Vuelve a la pantalla de inicio.
 
     - parameters:
        - sender: el botón de inicio
     */
    @IBAction func inicioPulsado(_ sender: UIButton) {
        self.hero.dismissViewController()
    }
    
}
