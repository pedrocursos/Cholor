// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

// Inicializadores

extension JuegoViewController {
    
    // MARK: - Bolas
    
    /**
     Crea la bola para lanzar.
     */
    func iniciarBolaLanzar() {
        bolaLanzar = Bola(color: .naranjaLanzar, material: self.material)
        vistaAreaJuego.addSubview(bolaLanzar.con.vistaImagen)
    }
    
    /**
     Inicializa el conjunto de bolas que estarán en el juego.
     
     - parameters:
     - numero: Cantidad de bolas que se mostrarán en el área de juego.
     
     - Important:
     La bola de lanzar está fuera del ámbito de inicialización de este método.
     */
    func iniciarBolas(numero: Int) {
        // La primera bola es naranaja, con lo cual tiene el mismo color que la bola de lanzamiento
        if numero > 0 {
            añadirBola(de: .naranja)
            // Se le resta 1 al totalBolas, ya que se ha añadido la primera bola de color naranja
            let totalBolas = numero - 1
            let colores = [ColorBola.azul, ColorBola.verde, ColorBola.rojo, ColorBola.amarillo]
            // 🤔 Opción 1
            /*
            let conjuntoBolas = totalBolas / colores.count
            let resto: Int = totalBolas % colores.count
            for _ in 0..<conjuntoBolas {
                for indice in 0..<colores.count {
                    añadirBola(de: colores[indice])
                }
            }
            for indice in 0..<resto {
                añadirBola(de: colores[indice])
            }
            */
            // 🤔 Opción 2
            _ = (0..<totalBolas)
                .map { añadirBola(de: colores[$0 % colores.count]) }
            // Añadir bola negra en el nivel indicado
            if valorNivel > 2 {
                añadirBola(de: .negro)
                hayBolaNegra = true
            }
        }
    }
    
    // MARK: Privado
    
    /**
     Crea y añade una bola a la pantalla.
     
     - parameters:
     - color: indica el color que tiene la bola según la enumeración *ColorBola*.
     */
    private func añadirBola(de color: ColorBola) {
        // Crear bola
        let bola = Bola(color: color, material: self.material)
        // Añadir bola al array
        bolas.append(bola)
        // Mostrar la bola en el área de juego
        vistaAreaJuego.insertSubview(bola.con.vistaImagen, belowSubview: bolaLanzar.con.vistaImagen)
    }
    
    // MARK: - UserDefaults
    
    /**
     Inicializa los valores por defecto cuando se instala la aplicación.
     */
    func iniciarUserDefaults() {
        // Nivel
        if Int(UserDefaults.compartido.obtenerNivel()) == 0 {
            UserDefaults.compartido.guardarNivel(1)
        }
        // Puntuación
        if Int(UserDefaults.compartido.obtenerPuntuacion()) == 0 {
            UserDefaults.compartido.guardarPuntuacion(200)
        }
    }
    
    // MARK: - Gestos
    
    /**
     Crea el gesto de arrastrar y se lo asigna a la bola de lanzamiento.
     */
    func iniciarGestoArrastrarBolaLanzar() {
        let arrastrar = UIPanGestureRecognizer(target: self, action: #selector(manejarArrastrar(sender:)))
        vistaAreaJuego.addGestureRecognizer(arrastrar)
    }
    
    // MARK: - Comportamientos dinámicos
    
    // MARK: - Comportamientos dinámicos
    
    /**
     Crea el comportamiento de empuje para la bola de lanzamiento.
     */
    func iniciarComportamientoEmpujarBolaLanzar() {
        empujarBolaLanzar = UIPushBehavior(items: [bolaLanzar.con.vistaImagen], mode: .continuous)
        animador.addBehavior(empujarBolaLanzar)
    }
    
    /**
     Inicializa el comportamiento dinámico empujar para las bolas
     */
    func iniciarComportamientoEmpujarBolas() {
        // 🤔 Opción 1
        /*
        for bola in bolas {
            let empujar = UIPushBehavior(items: [bola.con.vistaImagen], mode: .instantaneous)
            animador.addBehavior(empujar)
            empujar.pushDirection = bola.empujar.direccion
            empujar.magnitude = bola.empujar.magnitud
            empujarArray.append(empujar)
        }
        */
        // 🤔 Opción 2
        _ = bolas.map {
            let empujar = UIPushBehavior(items: [$0.con.vistaImagen], mode: .instantaneous)
            animador.addBehavior(empujar)
            empujar.pushDirection = $0.empujar.direccion
            empujar.magnitude = $0.empujar.magnitud
            empujarArray.append(empujar)
        }
    }
    
    /**
     Crea el comportamiento para las colisiones de las bolas.
     */
    func iniciarComportamientoColision() {
        // 🤔 Opción 1
        /*
        var items = [BolaImageView]()
        items.append(bolaLanzar.con.vistaImagen)
        bolas.forEach { bola in
            items.append(bola.con.vistaImagen)
        }
        */
        // 🤔 Opción 2
        var items = [bolaLanzar.con.vistaImagen]
        _ = bolas.map { items.append($0.con.vistaImagen) }
        // Crea el área de colisiones
        colision = UICollisionBehavior(items: items)
        let trayectoriaAreaJuego = UIBezierPath(rect: CGRect(x: 0, y: 0, width: vistaAreaJuego.frame.size.width, height: vistaAreaJuego.frame.size.height))
        colision.addBoundary(withIdentifier: "area juego" as NSCopying, for: trayectoriaAreaJuego)
        colision.collisionDelegate = self
        animador.addBehavior(colision)
    }
    
    /**
     Crea la unidad de comportamiento dinámico para la bola de lanzar.
     */
    func iniciarUnidadComportamientoBolaLanzar() {
        let imagenVista = bolaLanzar.con.vistaImagen
        let unidad = UIDynamicItemBehavior(items: [imagenVista])
        unidad.friction = bolaLanzar.unidad.friccion
        unidad.elasticity = bolaLanzar.unidad.elasticidad
        unidad.allowsRotation = bolaLanzar.unidad.permitirRotacion
        unidad.angularResistance = bolaLanzar.unidad.resistenciaAngular
        animador.addBehavior(unidad)
    }
    
    /**
     Crea las unidades de comportamiento dinámico para las bolas.
     */
    func iniciarUnidadesComportamientoBolas() {
        let imagenesVistas = bolas.map { $0.con.vistaImagen }
        let unidad = UIDynamicItemBehavior(items: imagenesVistas)
        // Se escoge la primera bola,
        // para poder acceder a sus valores de unidad de comportamiento dinámico.
        // Recordar: NO es necesario seleccionar las demás,
        // pues todas tienen la misma unidad de comportamiento.
        guard let bola = bolas.first else { return }
        unidad.friction = bola.unidad.friccion
        unidad.elasticity = bola.unidad.elasticidad
        unidad.allowsRotation = bola.unidad.permitirRotacion
        unidad.angularResistance = bola.unidad.resistenciaAngular
        animador.addBehavior(unidad)
    }
    
    // MARK: - Niveles
    
    /**
     Inicia una nueva partida al empezar un nuevo nivel.
     */
    func iniciarNuevoNivel() {
        // En este curso sólo se desarrolla la mecánica el juego del nivel 2
        // Eliminar elementos de la partida
        removerBolasDePantalla()
        removerBolas()
        removerBolaLanzarDePantalla()
        removerComportamientosDinamicos()
        // Inicializar los elementos de la partida
        esFinPartida = false
        AppDelegate.compartido().musicaFondoReproductor.volume = volumenMusicaFondo
        iniciarBolaLanzar()
        let numeroBolas = valorNivel < maxNivel ? valorNivel : self.maxNivel
        iniciarBolas(numero: numeroBolas)
        configurarEtiquetaSiguienteNivel()
        // Configurar los elementos de la partida
        configurarPosicionBolaLanzar()
        configurarPosicionBolas()
        iniciarComportamientoEmpujarBolaLanzar()
        iniciarComportamientoColision()
        iniciarUnidadComportamientoBolaLanzar()
        iniciarUnidadesComportamientoBolas()
        iniciarComportamientoEmpujarBolas()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.removerComportamientoEmpujarBolas()
        }
    }
    
    // MARK: - Partida
    
    /**
     Reinicia la partida cuando se vuelve de la pantalla listado.
     
     ## Recuerda:
     * Esta método sustituye a *viewDidLoad()* cuando se vuelve de la pantalla listado.
     * Sólo se ejecuta este método si el array de *bolas* está vacío.
     */
    func reiniciarPartida() {
        // Solo se reiniciará si se ha vaciado el array de las bolas
        if bolas.count == 0 {
            // Comportamientos dinámicos
            iniciarComportamientoEmpujarBolaLanzar()
            iniciarComportamientoColision()
            iniciarUnidadComportamientoBolaLanzar()
            iniciarUnidadesComportamientoBolas()
            // Recuerda: el método iniciarComportamientoEmpujarBolas() NO se incluye aquí, pues se llama en viewDidApear()
        }
    }
    
}
