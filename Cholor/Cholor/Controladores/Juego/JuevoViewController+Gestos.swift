// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

// Gestos

extension JuegoViewController {
    
    /**
     Acciona el comportamiento de la bola de lanzamiento cuando es arrastrada por el área del juego.
     
     - parameters:
        - sender: es el gesto de arrastre.
     */
    @objc func manejarArrastrar(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .possible:
            print("El gesto puede ser que sea un arrastre")
        case .began:
            bolaLanzar.con.vistaImagen.asignarAlLayer(una: #imageLiteral(resourceName: "Bola Naranja con Estela"))
        case .changed:
            moverBola(con: sender)
        case .ended:
            bolaLanzar.con.vistaImagen.asignarAlLayer(una: #imageLiteral(resourceName: "Bola Naranja"))
        case .cancelled:
            print("El arrastre ha sido cancelado")
        case .failed:
            print("El arrastre ha fallado")
        }
    }

    /**
     Mueve la bola de lanzamiento en el área de juego.
     
     - parameters:
        - sender: es el gesto de arrastre
     */
    func moverBola(con sender: UIPanGestureRecognizer) {
        let umbralLanzamiento:CGFloat = 0
        let divisorVelocidadLanzamiento = self.material.divisorVelocidadLanzamiento()
        let velocidad = sender.velocity(in: vistaAreaJuego)
        let magnitud = sqrt(pow(velocidad.x, 2) + pow(velocidad.y, 2))
        if magnitud > umbralLanzamiento {
            empujarBolaLanzar.pushDirection = CGVector(dx: velocidad.x / 10, dy: velocidad.y / 20)
            empujarBolaLanzar.magnitude = magnitud / divisorVelocidadLanzamiento
            let centroBola = bolaLanzar.con.vistaImagen.center
            let puntoPulsado = sender.location(in: vistaAreaJuego)
            let deltaX = puntoPulsado.x - centroBola.x
            let deltaY = puntoPulsado.y - centroBola.y
            let anguloEmpuje = atan2(deltaY, deltaX)
            // Obtener la unidad de comportamiento dinámico de la bola de lanzamiento
            // 🤔  Opción 1
            /*
            animador.behaviors.forEach { comportamiento in
                if comportamiento is UIDynamicItemBehavior {
                    let unidad = comportamiento as! UIDynamicItemBehavior
                    let items = unidad.items
                    items.forEach { vistaBola in
                        if vistaBola is BolaImageView {
                            let vistaImagen = vistaBola as! BolaImageView
                            if vistaImagen.obtenerColorBola() == .naranjaLanzar {
                                unidad.addAngularVelocity(CGFloat(anguloEmpuje), for: bolaLanzar.con.vistaImagen)
                            }
                        }
                    }
                }
            }
            */
            // 🤔  Opción 2
            let unidadArray = animador.behaviors
                .filter { $0 is  UIDynamicItemBehavior }
                .compactMap { ($0 as! UIDynamicItemBehavior) }
            let bolaNaranjaLanzarArray = animador.behaviors
                .filter { $0 is  UIDynamicItemBehavior }
                .flatMap { ($0 as! UIDynamicItemBehavior).items }
                .filter { $0 is BolaImageView }
                .map { ($0 as!  BolaImageView) }
                .filter { $0.obtenerColorBola() == .naranjaLanzar }
            guard let unidad = unidadArray.first,
                let bolaNaranjaLanzar = bolaNaranjaLanzarArray.first else { return }
            unidad.addAngularVelocity(CGFloat(anguloEmpuje), for: bolaNaranjaLanzar)
        }
    }
    
}
