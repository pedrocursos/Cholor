import UIKit

/// Vista que contiene una bola de color naranja con los gestos Pan y Tap (arrastrar y pulsar).
open class BolaGestosView: UIView {
    
    // MARK: - Propiedades
    
    lazy var pulsarGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(manejarPulsar(sender:)))
    lazy var arrastrarGestureRecogniser = UIPanGestureRecognizer(target: self, action: #selector(manejarArrastrar(sender:)))
    
    // MARK: - Inicialización
    
    public init() {
        super.init(frame : CGRect.zero)
        // Crea una constante con un array con los gestos que se añadirán a esta vista
        let gestos : [UIGestureRecognizer] = [
            pulsarGestureRecogniser,
            arrastrarGestureRecogniser
        ]
        // Añade los gestos a esta vista de la bola
        gestos.forEach({
            self.addGestureRecognizer($0)
        })
        
    }
    
    override public convenience init(frame : CGRect) {
        self.init()
        self.frame = frame
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) no ha sido implementado")
    }
    
    // MARK: - Acciones
    
    @objc func manejarPulsar(sender : UITapGestureRecognizer) {
//        let posicionPulsado = sender.location(in: self)
//        print("Pulsado: \(posicionPulsado.x), \(posicionPulsado.y)")
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundColor = .green
            self.escalar(a: 2)
        }) { _ in
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseIn, animations: {
                self.backgroundColor = .orange
                self.escalar(a: 1)
            }, completion: nil)
        }
    }
    
    @objc func manejarArrastrar(sender : UIPanGestureRecognizer) {
        let punto = sender.location(in: self)
        switch sender.state {
        case .began:
            escalar(a: 1.2)
//            print("Empieza en x: \(punto.x) y: \(punto.y)")
        case .changed:
            mover(con: sender)
//            print("Continua arrastrando en x: \(punto.x) y: \(punto.y)")
        case .ended:
            escalar(a: 1)
//            print("Termina en x: \(punto.x) y: \(punto.y)")
        default:
            print("Por defecto  en x: \(punto.x) y: \(punto.y)")
        }
    }
    
    // MARK: - Animaciones
    
    func escalar(a escala: CGFloat) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform(scaleX: escala, y: escala)
        }, completion: nil)
    }
    
    func mover(con gesto: UIPanGestureRecognizer) {
        let puntoDesplazamiento = gesto.translation(in: self)
        self.center = CGPoint(x:self.center.x + puntoDesplazamiento.x, y:self.center.y + puntoDesplazamiento.y)
        gesto.setTranslation(CGPoint.zero, in: self)
    }
    
}
