// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

// Animaciones

extension JuegoViewController {
    
    // MARK: - Bolas
    
    /**
     Animación para la finalización de la partida, cuando chocan las dos bolas naranjas.
     
     - parameters:
     - bolaLanzamiento: es la bola de lanzar.
     - bolaNaranja: es la bola naranja.
     */
    func animacionFinPartida(alChocar bolaLanzamiento: BolaImageView, contra bolaNaranja: BolaImageView) {
        let variacionEscala: CGFloat = 0.2
        let colorDestello = UIColor.azulDestello
        vistaAreaJuego.backgroundColor = colorDestello
        view.backgroundColor = colorDestello
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.escalarImagenEnLayer(de: bolaLanzamiento, con: 1 + variacionEscala)
            self.escalarImagenEnLayer(de: bolaNaranja, con: 1 - variacionEscala)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.15, options: .curveEaseInOut, animations: {
                self.escalarImagenEnLayer(de: bolaLanzamiento, con: (1 + variacionEscala) / 2)
                self.escalarImagenEnLayer(de: bolaNaranja, con: (1 - variacionEscala) / 2)
                self.ocultarImagenEnLayer(de: bolaLanzamiento)
                self.ocultarImagenEnLayer(de: bolaNaranja)
            }, completion: { _ in
                let colorFondo = UIColor.azulFondo
                self.vistaAreaJuego.backgroundColor = colorFondo
                self.view.backgroundColor = colorFondo
                // Pasar al siguiente nivel
                self.view.bringSubviewToFront(self.etiquetaSiguienteNivel)
                self.valorNivel = self.valorNivel < self.maxNivel ? self.valorNivel + 1 : self.maxNivel
                self.etiquetaMarcadorNivel.nuevaNumeracion(con: self.valorNivel)
                self.etiquetaSiguienteNivel.nuevaNumeracion(con: self.valorNivel)
                // Guardar en UserDefaults el nivel y los puntos al salir del juego
                UserDefaults.compartido.guardarNivel(self.valorNivel)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                    AppDelegate.compartido().musicaFondoReproductor.volume = 0.1
                    AppDelegate.compartido().siguienteNivelReproductor.play()
                    self.etiquetaSiguienteNivel.isHidden = false
                    // 🤔 Opción 1
                    /*
                     self.bolas.forEach{ bola in
                        bola.con.vistaImagen.alpha = 0.3
                     }
                     */
                    // 🤔 Opción 2
                    _ = self.bolas.map { $0.con.vistaImagen.alpha = 0.3 }
                    // Animar la etiqueta con el siguiente nivel
                    self.animacionSiguienteNivel()
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                        self.iniciarNuevoNivel()
                    }
                }
            })
        })
    }
    
    // MARK: - Botón inicio
    
    /**
     Anima el desplazamiento del botón inicio.
     
     - parameters:
     - valor: el nuevo valor que tendrá la restricción derecha del botón inicio.
     */
    func animarMovimientoBotonInicio(con valor: CGFloat) {
        self.restriccionDerechaBotonInicio.constant = valor
        UIButton.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // MARK: - Marcador
    
    /**
     Anima el marcador al sumarle puntos.
     */
    func animacionAñadirPuntosAlMarcador() {
        etiquetaMarcadorPuntos.animation = "flipY"
        etiquetaMarcadorPuntos.curve = "spring"
        etiquetaMarcadorPuntos.duration = 0.5
        etiquetaMarcadorPuntos.damping = 0
        etiquetaMarcadorPuntos.velocity = 0
        etiquetaMarcadorPuntos.animate()
    }
    
    /**
     Anima la etiqueta de puntos cuando se restan los puntos por golpear la bola negra.
     */
    func animacionPuntosNegativosConBolaNegra() {
        etiquetaMarcadorPuntos.animation = "flipX"
        etiquetaMarcadorPuntos.curve = "easeOutQuart"
        etiquetaMarcadorPuntos.duration = 0.5
        etiquetaMarcadorPuntos.damping = 0
        etiquetaMarcadorPuntos.velocity = 0
        etiquetaMarcadorPuntos.animate()
    }
    
    /**
     Anima la etiqueta de puntos cuando se restan los puntos por golpear otra bola.
     */
    func animacionPuntosNegativosChoqueBola() {
        etiquetaMarcadorPuntos.animation = "flipX"
        etiquetaMarcadorPuntos.curve = "easeInQuart"
        etiquetaMarcadorPuntos.duration = 0.5
        etiquetaMarcadorPuntos.damping = 0
        etiquetaMarcadorPuntos.velocity = 0
        etiquetaMarcadorPuntos.animate()
    }
    
    // MARK: - Niveles
    
    /**
     Anima la etiqueta con el número grande para indicar que se pasa al siguiente nivel.
     */
    func animacionSiguienteNivel() {
        etiquetaSiguienteNivel.animation = "wobble"
        etiquetaSiguienteNivel.curve = "easeInExpo"
        etiquetaSiguienteNivel.duration = 3
        etiquetaSiguienteNivel.force = 4.8
        etiquetaSiguienteNivel.damping = 0.7
        etiquetaSiguienteNivel.velocity = 0.7
        etiquetaSiguienteNivel.x = 133.3
        etiquetaSiguienteNivel.y = 126.7
        etiquetaSiguienteNivel.animate()
    }
    
}
