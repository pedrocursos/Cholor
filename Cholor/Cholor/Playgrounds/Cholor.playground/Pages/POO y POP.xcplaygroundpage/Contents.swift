//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### POO y POP

import Foundation

//: ### Herencia

//: 1. Herencia simple
// Clase y Programación Orientada a Objetos
class Avion {
    let alas: Bool
    init() {
        self.alas = true
    }
}
class Camion {
    let remolque: Bool
    init() {
        self.remolque = true
    }
}
class Transformer: Avion { }
//class TransformerCompleto: Avion, Camion { } // Error. no puede hacer herencia múltiple

let avion = Avion()
avion.alas
let camion = Camion()
camion.remolque
let transformer = Transformer()
transformer.alas

//: 2. Herencia múltiple
// Estructura y Programación Orientada a Protocolos
protocol Avionable {
    var alas: Bool { get }
}
extension Avionable {
    var alas: Bool {
        return true
    }
}
protocol Camionable {
    var remolque: Bool { get }
}
extension Camionable {
    var remolque: Bool {
        return true
    }
}
struct AvionAvanzado: Avionable { }
struct CamionAvanzado: Camionable { }
struct TransformerAvanzado: Avionable, Camionable { }

let avionAvanzado = AvionAvanzado()
avionAvanzado.alas
let camionAvanzado = CamionAvanzado()
camionAvanzado.remolque
let transformerAvanzado = TransformerAvanzado()
transformerAvanzado.alas
transformerAvanzado.remolque

class TransformerConProtocolos: Avionable, Camionable { }
let transformerDos = TransformerConProtocolos()
transformerDos.alas
transformerDos.remolque
