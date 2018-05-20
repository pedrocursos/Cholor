// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

/// Protocolo para el material de una bola.
protocol Materiable {
    
    /// Material obtenido de la enumeración *Material*
    var material: Material { get }
    
    /// Descripción en texto del tipo de material seleccionado en la enumeración *Material*
    var nombre: String { get }
    
    /// Peso de la bola, acorde al material seleccionado.
    var peso: Double { get }
    
    /**
     Inicialización del material que compone una bola.
     
     - parameters:
        - material: especifica de que material está hecha la bola.
     */
    init(_ material: Material)
    
}
