//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ## Arrays y Diccionarios

import UIKit

//: ### Arrays
// Ejemplos
let numeros = [1, 2, 3]
let animalesCompañia = ["gato", "perro"]
let dinosauros = ["diplodocus", "Tiranosaurio", "Triceratops"]
var herbivoros = ["oveja", "cabra"]
// Contanto los elementos del array
herbivoros.count
// Obteniendo un elemento del array
herbivoros[1]
// Añadiendo un nuevo elemento al array
herbivoros.append("vaca")
// Contanto los elementos otra vez
herbivoros.count
// Insertando un elemento en una posición determinada
herbivoros.insert("conejo", at: 1)

// Recorriendo todos los elementos del array
for animal in herbivoros {
    print(animal)
}
// Creando un array de arrays
let animalesArray = [animalesCompañia, dinosauros, herbivoros]
// Obteneniendo un elemento del array
animalesArray[0]
// Obteniendo el primer elemento del primer array
animalesArray[0][0]

//: ### Diccionarios
// Ejemplos
let sonidosAnimales = ["gato": "maulla", "perro": "ladra"]
var colorHerbivoros = ["oveja": UIColor.white, "cabra": UIColor.black]
// Contando los elementos del diccionario
colorHerbivoros.count
// Añadiendo un número elemento (conejo de color marrón)
colorHerbivoros["conejo"] = UIColor.brown
// Recorriendo los elementos de un diccionario
for (animal, color) in colorHerbivoros {
    print(animal, color)
}
// Creando un diccionario con arrays y diccionarios
let animalesDiccionario = ["animales compañia": animalesCompañia, "dinosaurios": dinosauros]
// Obteniendo un elemento del diccionario
animalesDiccionario["animales compañia"]
// Obteniendo el primer elemento elemento del primer diccionario
// ATENCIÓN: Se le añada ? de opcional, por que al ser un String existe la posibilidad de que sea nil
animalesDiccionario["animales compañia"]?[0]
