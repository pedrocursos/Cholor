// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

// Layers

extension JuegoViewController {
    
    /**
     Escala la imagen que está en el *contents* de la layer.
     
     - parameters:
     - bola: vista de imagen que tiene en su layer la imagen de la bola
     - escala: nueva escala para la imagen de la layer
     */
    func escalarImagenEnLayer(de bola: BolaImageView, con escala: CGFloat) {
        // Conseguir la layer con la imagen de la bola
        guard let layers = bola.layer.sublayers, let layer = layers.first else { return }
        // Escalar
        layer.setAffineTransform(CGAffineTransform(scaleX: escala, y: escala))
    }
    
    /**
     Oculta completamente la imagen de una bola.
     
     - parameters:
     - bola: vista de imagen que tiene en su layer la imagen de la bola.
     */
    func ocultarImagenEnLayer(de bola: BolaImageView) {
        // Conseguir la layer con la imagen de la bola
        guard let layers = bola.layer.sublayers, let layer = layers.first else { return }
        // Ocultar
        layer.opacity = 0
    }
    
}
