// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import Foundation

/// Protocolo para verificar igualdades entre bolas.
protocol Igualable {
    
    /**
     Verifica si se produce una colisión de una bola de un color específico con la bola de lanzar.
     
     - parameters:
     - otraBola: segunda bola con la que se produce la colisión.
     - color: es el color de la bola a verificar.
     
     - returns:
     Devuelve *true* si la bola del color deseado colisiona con la bola de lanzar.
     */
    func esColisionBolaLanzar(con otraBola: Self, de color: ColorBola) -> Bool
    
}
