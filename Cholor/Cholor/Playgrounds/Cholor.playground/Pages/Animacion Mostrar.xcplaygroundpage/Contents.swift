//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### Animación mostrar cuadrado
import UIKit
import PlaygroundSupport

// Fondo de previsualización

let fondo = FondoView(recuadro: CGRect(x: 0, y: 0, width: 300, height: 500), color: .white)
PlaygroundPage.current.liveView = fondo

// Crear cuadrado

let cuadrado = RectanguloView(recuadro: CGRect(x: 110, y: 210, width: 80, height: 80), color: .green)
fondo.addSubview(cuadrado)

// Animación

cuadrado.alpha = 0.2
UIView.animate(withDuration: 2) {
    cuadrado.alpha = 1
}
