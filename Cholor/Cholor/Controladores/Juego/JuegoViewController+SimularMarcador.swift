// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

// Simular Marcador

extension JuegoViewController {
    
    func sumarPuntosAlMarcador() {
        // Iniciar la ejecución del código pasados 2 segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            // Obtener los puntos actuales
            guard
                let textoPuntos = self.etiquetaMarcadorPuntos.text,
                let puntosActuales = Int(textoPuntos) else {
                    return
            }
            // Sumar los puntos
            let nuevosPuntos = puntosActuales + 150
            // Mostrar los nuevos puntos
            self.etiquetaMarcadorPuntos.nuevaNumeracion(con: nuevosPuntos)
            // Animación para la etiqueta de puntos
            self.animacionAñadirPuntosAlMarcador()
        }
    }
    
    func restarPuntosAlMarcador() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            // Obtener los puntos actuales
            guard
                let textoPuntos = self.etiquetaMarcadorPuntos.text,
                let puntosActuales = Int(textoPuntos) else {
                    return
            }
            // Restar los puntos
            let nuevosPuntos = puntosActuales - 100
            // Mostrar los nuevos puntos
            self.etiquetaMarcadorPuntos.nuevaNumeracion(con: nuevosPuntos)
            // Animaciones restar
//            self.animacionPuntosNegativosConBolaNegra()
            self.animacionPuntosNegativosChoqueBola()
        }
    }
    
    func siguienteNivelEnMarcador() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7)) {
            // Traer la etiqueta del siguiente nivel a primer plano
            self.view.bringSubview(toFront: self.etiquetaSiguienteNivel)
            // Sumar un nivel, si es menor que el máximo nivel establecido
            self.valorNivel = self.valorNivel < self.maxNivel ? self.valorNivel + 1 : self.maxNivel
            // Muestrar el nuevo nivel en las etiquetas
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
                // Pasados 4 segundos, iniciar un nuevo nivel
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
                    self.iniciarNuevoNivel()
                }
            }
        }
    }
    
}
