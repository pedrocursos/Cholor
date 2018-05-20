//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### Funciones

import UIKit

// Función básica

func sumaManzanas() {
    let primerLote = 2
    let segundoLote = 3
    let resultado = primerLote + segundoLote
}

sumaManzanas()

// Función pasándole parámetros

func sumaNaranjas(primerLote: Int, segundoLote: Int) {
    let resultado = primerLote + segundoLote
}

sumaNaranjas(primerLote: 2, segundoLote: 3)

// Función devolviendo valor

func sumaPeras(primerLote: Int, segundoLote: Int) -> Int {
    return primerLote + segundoLote
}

let resultado = sumaPeras(primerLote: 3, segundoLote: 2)
print(resultado)

