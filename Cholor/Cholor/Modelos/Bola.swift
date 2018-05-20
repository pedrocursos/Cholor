// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import Foundation

/// Estructura de una bola.
struct Bola: Bolable {
    
    // MARK: - Propiedades del protocolo *Bolable*
    
    var con: ConBolaColor
    var de: DeBolaMaterial
    var unidad: ValoresUnidadComportamientoDinamico
    var empujar: ValoresEmpujar
    
    // MARK: - Inicialización
    
    init(color: ColorBola, material: Material) {
        self.con = ConBolaColor(color)
        self.de = DeBolaMaterial(material)
        self.unidad = ValoresUnidadComportamientoDinamico(color: color, material: material)
        self.empujar = ValoresEmpujar(color: color, material: material)
    }
    
}
