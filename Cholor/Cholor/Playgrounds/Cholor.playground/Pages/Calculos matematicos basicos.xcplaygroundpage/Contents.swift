//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### Cálculos matemáticos básicos

import Foundation

// Suma
var suma = 1 + 2
suma += 3

// Resta
var resta = 6 - 1
resta -= 2

// Multiplicación
var multiplicar = 2 * 3
multiplicar *= 3

// División
var dividir: Double = 25 / 2
dividir /= 3
let resto = 25 % 2

// Orden de prioridad en cálculos:
// 1. División sobre multiplicación.
// 2. Resta sobre suma.
// 4. (División y multiplicación) sobre (resta y suma).
// 3 * 5 = 15; 15 + 2 = 17
let prioridadMultiplicacion = 2 + 3 * 5
// 15 / 5 = 3; 2 - 3 = -1
let prioridadDivision: Double = 2 - 15 / 5
// 5 / 4 = 1; 3 * 1 = 3; 2 + 3 = 5
let prioridadDivide: Double = 2 + 3 * 5 / 4
// 5 / 4 = 1; 3 * 1 = 3; 6 - 2 = 4; 4 + 3 = 7
let prioridadSobreOtras: Double = 6 - 2 + 3 * 5 / 4

// Mientras adquieres experiencia, usaremos los paréntesis.
// 5 / 4 = 1; 3 * 1 = 3; 6 - 2 = 4; 4 + 3 = 7
let prioridadConParentesis: Double = (6 - 2) + (3 * (5 / 4))
// Usando los paréntesis das prioridad a las operaciones que desees.
// 5 + 2 = 7; 7 - 3 = 4; 4 * 7 = 28; 28 / 8 = 3
let calculaComoQuieras: Double = ((((5 + 2) - 3) * 7) / 8)
