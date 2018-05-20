//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### Notificación

import UIKit
import PlaygroundSupport

extension Notification.Name {
    /// Nombre para la notificación de fin de animación.
    static let nombreFinAnimacionNotificacion = Notification.Name("finAnimacion")
}

class NotificacionViewController: LiveViewController {
    
    var cuadrado: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("🆕 Añadir notificación")
        NotificationCenter.default.addObserver(self, selector: #selector(NotificacionViewController.animacionColorCuadrado), name: .nombreFinAnimacionNotificacion, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        añadirCuadrado()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("👀 Esperando 3 segundos")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            // Lanzar notificación
            print("🚀 Lanzar notificación")
            NotificationCenter.default.post(name: .nombreFinAnimacionNotificacion, object: nil)
        }
    }
    
    // Añadir cuadrado en el centro de la pantalla
    
    func añadirCuadrado() {
        cuadrado = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        cuadrado.center = view.center
        cuadrado.backgroundColor = .yellow
        view.addSubview(cuadrado)
    }
    
    // Animación
    
    @objc func animacionColorCuadrado() {
        print("🏄‍♂️ Animación para poner de color morado el cuadrado")
        UIView.animate(withDuration: 1) {
            self.cuadrado.backgroundColor = .purple
        }
    }
}

// Previsualización

PlaygroundPage.current.liveView = NotificacionViewController()
