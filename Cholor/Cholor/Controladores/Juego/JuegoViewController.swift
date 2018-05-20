// Cholor app by Pedro Hernández
// Copyright © 2017 The eMotion Apps.

import UIKit
import Hero
import Spring

/// Clase que correponde con la Pantalla del área del Juego.
class JuegoViewController: UIViewController, ListadoDelegado {
    
    // MARK: - Propiedades
    
    // MARK: Elementos UI
    
    /// Etiqueta con los puntos conseguidos en el juego.
    @IBOutlet weak var etiquetaMarcadorPuntos: SpringLabel!
    /// Etiqueta con el número del nivel actual del juego.
    @IBOutlet weak var etiquetaMarcadorNivel: UILabel!
    /// Etiqueta con un número grande del siguiente nivel.
    @IBOutlet weak var etiquetaSiguienteNivel: SpringLabel!
    /// Botón para volver a la pantalla de inicio.
    @IBOutlet weak var botonInicio: UIButton!
    /// Vista para el área de juego.
    @IBOutlet weak var vistaAreaJuego: UIView!
    
    
    // MARK: Constraints
    
    /// Restricción del botón de inicio en su lado derecho hacia el lado derecho de la pantalla.
    @IBOutlet weak var restriccionDerechaBotonInicio: NSLayoutConstraint!
    
    //  MARK: Globales
    
    // Constantes
    
    /// Número máximo de niveles
    let maxNivel: Int = 7
    /// Puntos que se sumarán por golpear la bola del mismo color que la de lanzamiento.
    let puntosFinPartida = 300
    /// Puntos que se restarán por golpear otra bola que no es la del mismo color que la de lanzamiento.
    let puntosGolpeaOtraBola = 5
    /// Puntos que se restarán por golpear una bola negra.
    let puntosGolpearBolaNegra = 100
    
    // Variables
    
    /// Volumen inicial de la música de fondo, establecido en el segue de la página de inicio.
    lazy var volumenMusicaFondo: Double = {
        return AppDelegate.compartido().musicaFondoReproductor.volume
    }()
    /// Material que compone la bola.
    lazy var material: Material = {
        return UserDefaults.compartido.obtenerMaterial()
    }()
    /// Nivel del juego. Se usa sólo a nivel interno para reducir las lecturas de *UserDefaults*
    lazy var valorNivel: Int = {
        return UserDefaults.compartido.obtenerNivel()
    }()
    /// Valor inicial en el *Storyboard* de la restricción del lado derecho del botón inicio.
    lazy var valorRestriccionDerechaBotonInicio: CGFloat = {
        return restriccionDerechaBotonInicio.constant
    }()
    /// Bola de lanzamiento.
    var bolaLanzar: Bola!
    /// Bolas en el área de juego.
    /// ## Importante:
    /// La bola de lanzamiento NO está en este *Array*.
    var bolas = [Bola]()
    /// Indica si hay una bola negra en el juego.
    var hayBolaNegra = false
    /// Animador para coordinar los comportamientos dinámicos.
    lazy var animador: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: vistaAreaJuego)
    }()
    /// Comportamiento dinámico de empuje sobre la bola de lanzamiento.
    var empujarBolaLanzar: UIPushBehavior!
    /// Array para almacenar los comportamientos dinámicos de empuje de las bolas.
    var empujarArray = [UIPushBehavior]()
    /// Comportamiento para las colisiones.
    var colision: UICollisionBehavior!
    /// Controla si es el fin de la partida.
    var esFinPartida = false
    
    // MARK: - Ciclo de vida

    override func viewDidLoad() {
        super.viewDidLoad()

        // UserDefaults
        iniciarUserDefaults()
        // Bola para lanzar
        iniciarBolaLanzar()
        añadirBolaEnBotonInicioNotificacion()
        iniciarGestoArrastrarBolaLanzar()
        // Bolas
        iniciarBolas(numero: valorNivel)
        // Ocultar etiqueta siguiente nivel
        etiquetaSiguienteNivel.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reiniciarPartida()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Marcador
        configurarMarcador()
        configurarEtiquetaSiguienteNivel()
        // Bolas
        configurarPosicionBolaLanzar()
        configurarPosicionBolas()
        // Configurar los elementos de la partida
        iniciarComportamientoEmpujarBolaLanzar()
        iniciarComportamientoColision()
        iniciarUnidadComportamientoBolaLanzar()
        iniciarUnidadesComportamientoBolas()
        iniciarComportamientoEmpujarBolas()
        // Remover el empuje de las bolas para que así se paren poco a poco.
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.removerComportamientoEmpujarBolas()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Guardar en UserDefaults el nivel y los puntos al salir del juego
        guard let nivel = etiquetaMarcadorNivel.text,
            let puntos = etiquetaMarcadorPuntos.text else { return }
        UserDefaults.compartido.guardaNivel(nivel)
        UserDefaults.compartido.guardarPuntuacion(puntos)
        // Parar el movimiento de todas las bolas
        removerComportamientosDinamicos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
