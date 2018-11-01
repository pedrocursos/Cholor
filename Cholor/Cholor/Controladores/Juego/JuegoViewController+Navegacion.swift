// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit
import Hero

// Navegación

extension JuegoViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "irListado" {
            // Vista controladora de destino
            let listadoViewController = segue.destination as! ListadoViewController
            // Delegación
            listadoViewController.delegado = self
            // Transición
            listadoViewController.hero.isEnabled = true
            listadoViewController.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .left), dismissing: .slide(direction: .right))
        }
    }
    
}
