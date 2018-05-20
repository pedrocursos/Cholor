//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### Animación para aumentar el tamaño del cuadrado
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

UIView.animate(withDuration: 2, delay: 2, options: .curveEaseInOut, animations: {
    cuadrado.transform = CGAffineTransform(scaleX: 2, y: 2)
}) { _ in
    UIView.animate(withDuration: 2, animations: {
        cuadrado.transform = CGAffineTransform.identity
    })
}
