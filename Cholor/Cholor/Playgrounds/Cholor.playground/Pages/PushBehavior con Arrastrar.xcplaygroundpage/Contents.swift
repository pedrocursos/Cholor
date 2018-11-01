//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ## Comportamiento empuje con el gesto de pulsar

import UIKit
import PlaygroundSupport

class ComportamientoEmpujeConArrastrarViewController : LiveViewController {
    
    // Propiedades
    
    let rectanguloAreaJuego = CGRect(x: 10, y: 10, width: 355, height: 500)
    var cuadrado: UIView!
    var animador: UIDynamicAnimator!
    var empujar: UIPushBehavior!
    var colision: UICollisionBehavior!
    
    // Ciclo de vida
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        añadirAreaJuego()
        añadirCuadrado()
        crearAnimador()
        crearColision()
        crearEmpujar()
        crearGestoArrastrar()
    }
    
    // UI elementos
    
    func añadirAreaJuego() {
        let rectangulo = UIView(frame: rectanguloAreaJuego)
        rectangulo.backgroundColor = UIColor(displayP3Red: 0.6, green: 0.9, blue: 1, alpha: 1)
        view.addSubview(rectangulo)
    }
    
    func añadirCuadrado() {
        cuadrado = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        cuadrado.backgroundColor = UIColor(displayP3Red: 1, green: 0.2, blue: 0.9, alpha: 1)
        cuadrado.layer.borderColor = UIColor.black.cgColor
        cuadrado.layer.borderWidth = 10
        cuadrado.center = view.center
        view.addSubview(cuadrado)
    }
    
    // Dinámicas
    
    func crearAnimador() {
        animador = UIDynamicAnimator(referenceView: view)
    }
    
    func crearColision() {
        // Crear la detección de la colisión
        colision = UICollisionBehavior(items: [cuadrado])
        let trayectoriaDispositivo = UIBezierPath(rect: rectanguloAreaJuego)
        colision.addBoundary(withIdentifier: "area juego" as NSCopying, for: trayectoriaDispositivo)
        // Añadir la colisión al animador
        animador.addBehavior(colision)
    }
    
    func crearEmpujar() {
        // Crear el comportamiento de empuje
        empujar = UIPushBehavior(items: [cuadrado], mode: .continuous)
        // Añadir el empuje al animador
        animador.addBehavior(empujar)
    }
    
    // Gesto
    
    func crearGestoArrastrar() {
        let gestoArrastrar = UIPanGestureRecognizer(target: self, action: #selector(manejarArrastrar(sender:)))
        guard let cuadrado = cuadrado else {
            print("El cuadrado es nil")
            return
        }
        cuadrado.addGestureRecognizer(gestoArrastrar)
    }
    
    // Acción
    
    @objc func manejarArrastrar(sender: UIPanGestureRecognizer) {
        // Cálculo de un vector de lanzamiento, basado en la velocidad del gesto de arrastre
        let umbralLanzamiento:CGFloat = 0
        let margenVelocidadLanzamiento: CGFloat = 35
        let velocidad = sender.velocity(in: view)
        let magnitud = sqrt(pow(velocidad.x, 2) + pow(velocidad.y, 2))
        if magnitud > umbralLanzamiento {
            empujar.pushDirection = CGVector(dx: velocidad.x / 10, dy: velocidad.y / 20)
            empujar.magnitude = magnitud / margenVelocidadLanzamiento
            // Crear item de comportamiento dinámico
            let itemComportamiento = UIDynamicItemBehavior(items: [cuadrado])
            itemComportamiento.friction = 0.2
            // Opcion 1: permite rotación del cuadrado
            itemComportamiento.allowsRotation = true
            // Opción 2: No permite la rotación del cuadrado
            //            itemComportamiento.allowsRotation = false
            //            itemComportamiento.angularResistance = 10000
            // Cálculo de la velocidad de rotación
            let centroPuntoCuadrado = cuadrado.center
            let puntoPulsado = sender.location(in: view)
            let deltaX = puntoPulsado.x - centroPuntoCuadrado.x
            let deltaY = puntoPulsado.y - centroPuntoCuadrado.y
            let anguloEmpuje = atan2(deltaY, deltaX)
            itemComportamiento.addAngularVelocity(CGFloat(anguloEmpuje), for: cuadrado)
            // Añadir el item al animador
            animador.addBehavior(itemComportamiento)
        }
    }
    
}

// Muestra el view controller in la ventana Live View
PlaygroundPage.current.liveView = ComportamientoEmpujeConArrastrarViewController()
