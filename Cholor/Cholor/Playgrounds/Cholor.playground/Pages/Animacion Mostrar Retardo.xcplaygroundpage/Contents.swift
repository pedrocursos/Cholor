//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### Animación mostrar cuadrado con retardo
import UIKit
import PlaygroundSupport

// Fondo previsualización

let fondo = FondoView(recuadro: CGRect(x: 0, y: 0, width: 300, height: 500), color: .white)
PlaygroundPage.current.liveView = fondo

// Crear cuadrado

let cuadrado = RectanguloView(recuadro: CGRect(x: 110, y: 210, width: 80, height: 80), color: .green)
fondo.addSubview(cuadrado)

// Animación

UIView.animate(withDuration: 1, delay: 2, options: .curveEaseOut, animations: {
    cuadrado.alpha = 0
}) { _ in
    UIView.animate(withDuration: 1, animations: {
        cuadrado.alpha = 1
    })
}

