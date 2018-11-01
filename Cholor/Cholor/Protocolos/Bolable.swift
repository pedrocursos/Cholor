// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import Foundation

/// Protocolo para una bola.
protocol Bolable {
    
    /// Abreviatura de la *struct ConBolaColor*
    /// ## Propiedades:
    /// * color
    /// * vistaImagen
    var con: ConBolaColor { get }
    
    /// Abreviatura de la *struct DeBolaMaterial*
    /// ## Propiedades:
    /// * material
    /// * nombre
    /// * peso
    var de: DeBolaMaterial { get }
    
    /// Abreviatura de los valores necesarios para crear un *UIDynamicItemBehavior* para una bola.
    /// ## Propiedades:
    /// * permitirRotacion
    /// * resistenciaAngular
    /// * elasticidad
    /// * friccion
    var unidad: ValoresUnidadComportamientoDinamico { get }
    
    /// Abreviatura de los valores necesarios para crear un *UIPushBehavior* para una bola.
    /// ## Propiedades:
    /// * magnitud
    /// * direccion
    var empujar: ValoresEmpujar { get }
    
    /**
     Método de inicialización
     
     - parameters:
     - color: especifica el color de la bola.
     - material: especifica de que material está hecha la bola.
     */
    init(color: ColorBola, material: Material)
    
}
