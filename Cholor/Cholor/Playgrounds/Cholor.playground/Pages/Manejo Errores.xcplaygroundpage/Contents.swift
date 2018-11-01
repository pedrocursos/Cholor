//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### Manejo de Errores

import UIKit

var estadoEstrella = "brilla"
var estadoAgujeroNegro: String? = nil

func devolver(_ estado: String) -> String {
    return "La estrella \(estado)"
}

devolver(estadoEstrella)

// devolver(estadoAgujeroNegro) // devuelve error, porque el estado del agujero negro es nil, es decir, vacío (no existe).

func devolverManejandoError(_ estado: String?) -> String {
    guard let estadoActual = estado else {
        return "El estado del agujero negro es vacío"
    }
    return "La estrella \(estadoActual)"
}

devolverManejandoError(estadoEstrella)
devolverManejandoError(estadoAgujeroNegro)
