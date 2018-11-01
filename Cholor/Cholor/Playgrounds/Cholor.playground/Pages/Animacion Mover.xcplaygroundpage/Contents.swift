//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### Animación mover cuadrado hacia arriba
import UIKit
import PlaygroundSupport

// Fondo previsualización

let fondo = FondoView(recuadro: CGRect(x: 0, y: 0, width: 300, height: 500), color: .white)
PlaygroundPage.current.liveView = fondo

// Crear cuadrado

let cuadrado = RectanguloView(recuadro: CGRect(x: 0, y: 0, width: 80, height: 80), color: .green)
cuadrado.center = fondo.center
fondo.addSubview(cuadrado)

// Animación

UIView.animate(withDuration: 2) {
    cuadrado.transform = CGAffineTransform(translationX: 0, y: -(fondo.frame.height -  cuadrado.frame.height) / 2)
}
