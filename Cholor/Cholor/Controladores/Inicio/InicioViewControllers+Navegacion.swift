// Cholor app by Pedro Hernández
// Copyright © 2017 The eMotion Apps.

import UIKit
import Hero

// Navegación

extension InicioViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "irJuego" {
            // Música
            guard let fondoReproductor = AppDelegate.compartido().musicaFondoReproductor, let botonReproductor = AppDelegate.compartido().botonJugarReproductor else { return }
            fondoReproductor.volume = 0.2
            botonReproductor.play()
            // Vista controladora de destino
            let juegoViewController = segue.destination as! JuegoViewController
            // Transición
            juegoViewController.hero.isEnabled = true
            juegoViewController.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        }
    }
    
}
