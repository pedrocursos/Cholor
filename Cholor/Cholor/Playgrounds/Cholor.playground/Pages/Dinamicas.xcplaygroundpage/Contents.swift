//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ## Dinámicas

import UIKit
import PlaygroundSupport

// Crear fondo para la previsualización
let fondo = FondoView(recuadro: CGRect(x: 0, y: 0, width: 300, height: 500), color: .white)
PlaygroundPage.current.liveView = fondo

// Crear bola
let bola : UIView = {
    let diametro: CGFloat = 50
    let vista = UIView(frame: CGRect(x: (fondo.frame.size.width - diametro) / 2, y: 100, width: diametro, height: diametro))
    vista.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    vista.backgroundColor = UIColor(displayP3Red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
    vista.layer.cornerRadius = diametro / 2
    vista.layer.masksToBounds = true
    return vista
}()
// Añadir la bola al fondo
fondo.addSubview(bola)

// Crear animador para los comportamientos dinámicos
let animador = UIDynamicAnimator(referenceView: fondo)

// Crear gravedad y añadirla al animador
let gravedad = UIGravityBehavior(items: [bola])
animador.addBehavior(gravedad)

// Crear colisión y añadirla al animador
let colision = UICollisionBehavior(items: [bola])
colision.translatesReferenceBoundsIntoBoundary = true
animador.addBehavior(colision)

// Crear elasticidad y añadirla al animador
let elasticidad = UIDynamicItemBehavior(items: [bola])
elasticidad.elasticity = 0.75
animador.addBehavior(elasticidad)
