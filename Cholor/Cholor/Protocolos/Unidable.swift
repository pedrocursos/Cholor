// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

/// Protocolo con los valores para crear una unidad de comportamiento dinámico (*UIDynamicItemBehavior*)
protocol Unidable {
    /// Especifica si se permite la rotación de un elemento (*allowsRotation*).
    /// ## Detalles:
    /// El valor predeterminado es *true*. Para deshabilitar la rotación, establecer esta propiedad en *false*.
    var permitirRotacion: Bool { get }
    
    /// La resistencia angular de un elemento (*angularResistance*).
    /// ## Detalles:
    /// El rango válido es 0 hasta *CGFLOAT_MAX*.
    /// Cuanto mayor es el valor, mayor es la amortiguación angular y la rotación se ralentiza hasta detenerse.
    var resistenciaAngular: CGFloat { get }
    
    /// La cantidad de elasticidad aplicada a las colisiones entre elementos (*elasticity*).
    /// ## Detalles:
    /// El valor predeterminado es 0.0. El rango válido es desde 0.0 para ningún rebote tras la colisión, hasta 1.0 para las colisiones completamente elásticas.
    var elasticidad: CGFloat { get }
    
    /// Resistencia lineal cuando dos elementos se deslizan uno contra el otro (*friction*).
    /// ## Detalles:
    /// El valor predeterminado es 0.0, que corresponde a la ausencia de fricción. Usa un valor de 1.0 para aplicar una fricción fuerte. Para aplicar una fricción aún más fuerte, tienes que usar números más altos.
    var friccion: CGFloat { get }
    
    /**
     Inicialización de una unidad de comportamiento dinámico (*UIDynamicItemBehavior*).
     
     - parameters:
        - color: especifica el color de bola.
        - material: especifica de que material está hecha la bola.
     */
    init(color: ColorBola, material: Material)
}
