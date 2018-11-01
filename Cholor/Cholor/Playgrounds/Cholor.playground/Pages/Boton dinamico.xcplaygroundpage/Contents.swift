//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ## Botón dinámico

import UIKit
import PlaygroundSupport

class BotonDinamicoViewController : LiveViewController {
    
    // Propiedades
    
    var animador: UIDynamicAnimator!
    var boton: UIButton!
    
    // Ciclo de vida
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Color de fondo
        self.view.backgroundColor = .yellow
        // Iniciar animador
        animador  = UIDynamicAnimator(referenceView: self.view)
        // Crear botón
        iniciarBoton()
        // Iniciar un comportamiento dinámico
        let comportamientoSnap = UISnapBehavior(item: boton, snapTo: self.view.center)
        comportamientoSnap.damping = 0.5
        animador.addBehavior(comportamientoSnap)
    }
    
    // Elemento UI
    
    func iniciarBoton() {
        // Tipo de botón
        boton = UIButton(type: UIButton.ButtonType.system) as UIButton
        // Dimensiones
        let ancho: CGFloat = 150
        let alto: CGFloat = 50
        let posicionX: CGFloat = self.view.frame.width/2 - ancho/2
        let posicionY: CGFloat = 100
        boton.frame = CGRect(x:posicionX, y:posicionY, width:ancho, height:alto)
        // Color de fondo
        boton.backgroundColor = UIColor.magenta
        // Texto
        boton.setTitle("¡Púlsame!", for: .normal)
        boton.tintColor = .white
        boton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        // Acción
        boton.addTarget(self, action: #selector(BotonDinamicoViewController.botonPulsado(_:)), for: .touchUpInside)
        // Añadir el botón a la vista del View Controller
        self.view.addSubview(boton)
    }
    
    // Acción
    
    @objc func botonPulsado(_ sender:UIButton!) {
        print("Boton pulsado 🔔")
    }
    
}

// Muestra el view controller en la ventana de Live View
PlaygroundPage.current.liveView = BotonDinamicoViewController()
