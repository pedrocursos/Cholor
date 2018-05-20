//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ## Transformando Arrays (Programación funcional)

import Foundation

// For in

let numeros = [1, 2, 3, 4, 5, 6]

ejemplo(de: "for in de números") {
    var multiplicar = [Int]()
    for numero in numeros {
        multiplicar.append(numero * 100)
    }
    print(multiplicar)
}

// For Each

ejemplo(de: "forEach de números") {
    var multiplicar = [Int]()
    numeros.forEach { numero in
        multiplicar.append(numero * 100)
    }
    print(multiplicar)
}

ejemplo(de: "forEach de números simplificado") {
    var multiplicar = [Int]()
    numeros.forEach { multiplicar.append( $0 * 100) }
    print(multiplicar)
}

// Map

ejemplo(de: "map de números") {
    let multiplicar = numeros.map { $0 * 100 }
    print(multiplicar)
}

// Filter

ejemplo(de: "filter de números") {
    let seis = numeros.filter { $0 == 6 }
    print(seis)
}

// Reduce

ejemplo(de: "reduce de números") {
    // Número base 0
    let suma = numeros.reduce (0) { $0 + $1 }
    print(suma)
    // Número base 100
    let sumaInicial = numeros.reduce(100) { $0 + $1 }
    print(sumaInicial)
}

// FlatMap

ejemplo(de: "flatmap de arrays de números") {
    let centenas = [100, 200, 300]
    let millares = [5000, 6000]
    let todos = [numeros, centenas, millares]
    let numerosJuntos = todos.flatMap { $0 }
    print(numerosJuntos)
}

// Encadenamiento

ejemplo(de: "Encadenamiento sencillo") {
    let centenas = [100, 200, 300]
    let millares = [5000, 6000]
    let todos = [numeros, centenas, millares]
    let seis = todos
        .flatMap { $0 }
        .filter { $0 == 6}
    print(seis)
}

// Ejemplo de encadenamiento complejo

struct Bailar {
    var items: [String]
}

struct Cantar {
    var items: [String]
}

struct Persona {
    var pasatiempos: [Any]!
    
    init() {
        let cantar = Cantar(items: ["opera", "rap"])
        let bailar = Bailar(items: ["rock", "valses"])
        self.pasatiempos = [cantar, bailar]
    }
}

let persona = Persona()

ejemplo(de: "forEach complejo") {
    
    persona.pasatiempos.forEach { pasatiempo in
        if pasatiempo is Cantar {
            let cantar = pasatiempo as! Cantar
            let items = cantar.items
            items.forEach { item in
                if item == "rap" {
                    print("Cantar \(item) me gusta")
                    print("🤙")
                }
            }
        }
    }
}

ejemplo(de: "Encadenamiento complejo") {
    
    let rapArray = persona.pasatiempos
        .filter { $0 is Cantar }
        .flatMap { ($0 as! Cantar).items }
        .filter { $0 == "rap" }
    guard let rap = rapArray.first else { return }
    print("Cantar \(rap) me gusta")
    print("👏👏")
}
