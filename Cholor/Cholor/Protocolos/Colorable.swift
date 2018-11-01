// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import Foundation

/// Protocolo con el color y la imagen de la bola.
protocol Colorable {
    
    /// Color de la bola, basado en la enumeración *ColorBola*
    var color: ColorBola { get }
    
    /// Vista de imagen de la bola, según el color seleccionado.
    var vistaImagen: BolaImageView { get }
    
    /**
     Inicialización de la vista de imagen de la bola a partir de un color especificado.
     
     - parameters:
     - color: especifica el color de la bola.
     */
    init(_ color: ColorBola)
    
}
