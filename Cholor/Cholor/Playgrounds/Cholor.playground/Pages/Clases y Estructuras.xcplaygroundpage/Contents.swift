//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### Clases y Estructuras

import Foundation

//: ### Tipos de valores.

//: 1. Valor referencia.
// Clase

class PistaClase: CustomStringConvertible {
    let sentimiento: String
    var actividad: String
    init(sentimiento: String, actividad: String) {
        self.sentimiento = sentimiento
        self.actividad = actividad
    }
    
    var description: String {
        return sentimiento + " la pista de " + actividad
    }
}

let pistaClase = PistaClase(sentimiento: "Me gusta", actividad: "🕺")
pistaClase.actividad = "⛸"

//: 2. Valor tipo.
// Estructura
struct PistaEstructura: CustomStringConvertible {
    let sentimiento: String
    var actividad: String
    init(sentimiento: String, actividad: String) {
        self.sentimiento = sentimiento
        self.actividad = actividad
    }
    
    var description: String {
        return sentimiento + " la pista de " + actividad
    }
}

let pistaEstructura = PistaEstructura(sentimiento: "Me gusta", actividad: "⛹️‍♂️")
// pistaEstructura.actividad = "❄️" // Error porque la instancia pistaEstructura es una constante.
var pistaEstructuraVariable = PistaEstructura(sentimiento: "Disfruto siempre en", actividad: "🏓")
pistaEstructuraVariable.actividad = "🏐"
