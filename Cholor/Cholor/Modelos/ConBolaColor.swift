// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

/// Estructura con la vista de imagen de una bola, según un color especificado.
struct ConBolaColor: Colorable {
    
    // MARK: - Propiedades del protocolo *Colorable*
    
    var color: ColorBola
    var vistaImagen: BolaImageView
    
    // MARK: - Inicialización
    
    init(_ color: ColorBola) {
        var imagen: UIImage!
        switch color {
        case .naranjaLanzar:
            imagen = #imageLiteral(resourceName: "Bola Naranja")
        case .naranja:
            imagen = #imageLiteral(resourceName: "Bola Naranja")
        case .azul:
            imagen = #imageLiteral(resourceName: "Bola Azul")
        case .verde:
            imagen = #imageLiteral(resourceName: "Bola Verde")
        case .rojo:
            imagen = #imageLiteral(resourceName: "Bola Roja")
        case .amarillo:
            imagen = #imageLiteral(resourceName: "Bola Amarilla")
        case .negro:
            imagen = #imageLiteral(resourceName: "Bola Negra")
        }
        self.color = color
        self.vistaImagen = BolaImageView(de: Diametro.bola, con: imagen, del: color)
    }
    
}
