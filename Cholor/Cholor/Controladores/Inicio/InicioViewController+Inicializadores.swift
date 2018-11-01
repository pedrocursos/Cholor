// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit
import AVFoundation

// Inicializadores

extension InicioViewController {
    
    /**
     Inicia la reproducción de la música de fondo del juego.
     */
    func iniciarReproductor() {
        // Reproducir la música de fondo
        guard let reproductor = AppDelegate.compartido().musicaFondoReproductor else {
            return
        }
        reproductor.play()
    }
    
}
