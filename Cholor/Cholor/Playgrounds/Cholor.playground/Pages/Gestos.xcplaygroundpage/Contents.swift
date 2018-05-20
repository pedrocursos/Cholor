//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ## Gestos

import UIKit
import PlaygroundSupport

// Fondo previsualización
let fondo = FondoView(recuadro: CGRect(x: 0, y: 0, width: 300, height: 500), color: .white)
PlaygroundPage.current.liveView = fondo

// Crear bola
let bola : BolaGestosView = {
    let view = BolaGestosView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    view.backgroundColor = .orange
    return view
}()
// Centrado de la bola
bola.center = fondo.center
// Añadir bola a la vista del fondo
fondo.addSubview(bola)
