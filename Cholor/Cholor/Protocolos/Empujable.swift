// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

/// Protocolo que contiene los valores necesarios parar crear un comportamiento de empuje (*UIPushBehavior*)
protocol Empujable {
    
    /// La magnitud del vector de fuerza para un elemento (*magnitude*).
    /// ## Detalles:
    /// * La magnitud predeterminada es nula, equivalente a ninguna fuerza.
    /// * Un vector de fuerza continua con una magnitud de 1.0, aplicado a una vista de 100 puntos x 100 puntos cuyo valor de densidad es 1.0, da como resultado una aceleración de vista de 100 puntos / segundo² en la dirección indicada por el ángulo o la propiedad pushDirection.
    /// * Establecer el parámetro de magnitud en un valor negativo invierte la dirección de la fuerza.
    var magnitud: CGFloat { get }
    
    /// La dirección del vector de fuerza para el comportamiento (*pushDirection*), expresada como componentes x e y, y utilizando la geometría UIKit estándar.
    /// ## Detalles:
    /// * Los valores por defecto de x e y del vector de dirección de empuje son 0.0.
    /// * Un valor para cualquiera de los componentes de 1.0, aplicado a una vista de 100 puntos * 100 puntos, cuyo valor de densidad es 1.0, da como resultado una aceleración de vista de 100 puntos / segundo² en la dirección positiva para el componente.
    /// * Establecer cualquiera de los componentes de dirección en un valor negativo invierte la dirección de la fuerza para el componente.
    /// * Ya sea que exprese la dirección de empuje de un comportamiento de empuje en términos de componentes x, y o con un ángulo (utilizando la propiedad de ángulo), el valor equivalente alternativo se actualiza automáticamente.
    var direccion: CGVector { get }
    
    /**
     Inicialización de un comportamiento de empuje (*UIPushBehavior*).
     
     - parameters:
     - color: especifica el color de bola.
     - material: especifica de que material está hecha la bola.
     */
    init(color: ColorBola, material: Material)
}
