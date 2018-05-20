//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ## Collision Delegate

import UIKit
import PlaygroundSupport

class DelegadoColisionesViewController : LiveViewController, UICollisionBehaviorDelegate {
    
    // Propiedades
    
    let limiteAreaJuego = "area juego"
    let rectanguloAreaJuego = CGRect(x: 50, y: 50, width: 275, height: 400)
    var bolas = [UIView]()
    var animador: UIDynamicAnimator!
    
    // Ciclo de vida
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        añadirAreaJuego()
        añadirBolas()
        // Inicializar animador
        animador  = UIDynamicAnimator(referenceView: self.view)
        // Crear gravedad y añadirla al animador
        let gravedad = UIGravityBehavior(items: bolas)
        animador.addBehavior(gravedad)
        // Crear colisión
        let colision = UICollisionBehavior(items: bolas)
        colision.addBoundary(withIdentifier: limiteAreaJuego as NSCopying, for: UIBezierPath(rect: rectanguloAreaJuego))
        // Añadir la delegación a la colisón
        colision.collisionDelegate = self
        // Añadir la colisión al animador
        animador.addBehavior(colision)
    }
    
    // Collision Delegate
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if identifier as? String == limiteAreaJuego {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                let bola = item as! UIView
                bola.layer.borderWidth = 5
                bola.layer.borderColor = bola.backgroundColor?.cgColor
                bola.backgroundColor = .darkGray
                bola.alpha = 0
                bola.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: { _ in
                let bola = item as! UIView
                behavior.removeItem(item)
                bola.removeFromSuperview()
            })
        }
    }
    
    // Elementos UI
    
    func añadirAreaJuego() {
        let rectangulo = UIView(frame: rectanguloAreaJuego)
        rectangulo.backgroundColor = .black
        view.addSubview(rectangulo)
    }
    
    func añadirBolas() {
        let colores = [UIColor.red, .green, .magenta, .purple, .yellow]
        let diametro: CGFloat = 50
        var puntoLanzamientoBola = CGPoint(x: view.center.x, y: diametro*2)
        let tamañoBola = CGSize(width: diametro, height: diametro)
        for indice in 0..<colores.count {
            let nuevaBola = UIView(frame: CGRect(x: 0, y: 0, width: tamañoBola.width, height: tamañoBola.height))
            nuevaBola.backgroundColor = colores[indice]
            nuevaBola.layer.cornerRadius = nuevaBola.bounds.size.width/2
            nuevaBola.center = puntoLanzamientoBola
            puntoLanzamientoBola.y += tamañoBola.height + 10
            bolas.append(nuevaBola)
            view.addSubview(nuevaBola)
        }
    }
    
}

// Muestra el view controller en la ventana de Live View
PlaygroundPage.current.liveView = DelegadoColisionesViewController()
