// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

// Delegación para las colisiones

extension JuegoViewController: UICollisionBehaviorDelegate {
    
    // MARK: - Métodos protocolo UICollisionBehaviorDelegate
    
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?) {
        // Sonido al tocar el límite del área de juego
        AppDelegate.compartido().colisionParedReproductor.play()
        // Mueve el botón de inicio si la bola de lanzamiento está sobre él
        if estaBolaLanzarSobreBotonInicio() {
            // Envía notificación
            NotificationCenter.default.post(name: .nombreBolaEnBotonInicioNotificacion, object: nil)
        }
        // Elimina la estela de la bola pasado 1 segundo
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.bolaLanzar.con.vistaImagen.asignarAlLayer(una: #imageLiteral(resourceName: "Bola Naranja"))
        }
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        // Color de las bolas
        if item1 is BolaImageView && item2 is BolaImageView {
            // Puntos actuales
            guard let textoPuntos = etiquetaMarcadorPuntos.text, let puntosActuales = Int(textoPuntos) else { return }
            if !esFinPartida {
                let bola1 = item1 as! BolaImageView
                let bola2 = item2 as! BolaImageView
                // Comprueba si alguna bola es la de lanzar, para así evitar verificaciones innecesarias
                if bola1.obtenerColorBola() == .naranjaLanzar || bola2.obtenerColorBola() == .naranjaLanzar {
                    // Colisión con bola lanzar
                    if bola1.esColisionBolaLanzar(con: bola2, de: .naranja) {
                        // Colisiona con una bola naranja
                        esFinPartida = true
                        // Reproducir el sonido de fin de colisión de fin de partida
                        AppDelegate.compartido().colisionBolasNaranjasReproductor.play()
                        // Añadir puntos
                        etiquetaMarcadorPuntos.nuevaNumeracion(con: puntosActuales + puntosFinPartida)
                        animacionAñadirPuntosAlMarcador()
                        // Desaparecen las bolas con un destello en el fondo
                        var bolaLanzamiento: BolaImageView!
                        var bolaNaranja: BolaImageView!
                        if bola1.obtenerColorBola() == .naranjaLanzar {
                            bolaLanzamiento = bola1
                            bolaNaranja = bola2
                        } else {
                            bolaLanzamiento = bola2
                            bolaNaranja = bola1
                        }
                        animacionFinPartida(alChocar: bolaLanzamiento, contra: bolaNaranja)
                    } else if hayBolaNegra && bola1.esColisionBolaLanzar(con: bola2, de: .negro) {
                        // Colisiona con una bola negra
                        // Reproducir el sonido del coque con la bola negra
                        AppDelegate.compartido().colisionConBolaNegraReproductor.play()
                        // Restar puntos
                        etiquetaMarcadorPuntos.nuevaNumeracion(con: puntosActuales - puntosGolpearBolaNegra)
                        animacionPuntosNegativosConBolaNegra()
                        // Eliminar bola negra
                        var bolaNegra: BolaImageView!
                        if bola1.obtenerColorBola() == .negro {
                            bolaNegra = bola1
                        } else {
                            bolaNegra = bola2
                        }
                        self.ocultarImagenEnLayer(de: bolaNegra)
                        bolaNegra.isHidden = true
                        colision.removeItem(bolaNegra)
                        empujarBolaLanzar.removeItem(bolaNegra)
                        bolaNegra.removeFromSuperview()
                        // 🤔 Opción 1
                        /*
                        for indice in 0..<bolas.count {
                            if bolas[indice].con.color == .negro {
                                bolas.remove(at: indice)
                                hayBolaNegra = false
                                break
                            }
                        }
                        */
                        // 🤔 Opción 2
                        _ = (0..<bolas.count)
                            .filter { bolas[$0].con.color == .negro }
                            .map {
                                bolas.remove(at: $0)
                                hayBolaNegra = false
                        }
                    } else {
                        
                        // Colisiona con otras bolas
                        // Reproducir el sonido de choque de bolas
                        AppDelegate.compartido().colisionBolasReproductor.play()
                        // Restar puntos
                        etiquetaMarcadorPuntos.nuevaNumeracion(con: puntosActuales - puntosGolpeaOtraBola)
                        animacionPuntosNegativosChoqueBola()
                    }
                }
            }
        }
    }
    
    // MARK: Privado
    
    /**
     Verifica si la bola de lanzamiento está en el área del botón de inicio.
     
     - returns:
     Devuelve *true* si la bola está sobre el botón.
     */
    func estaBolaLanzarSobreBotonInicio() -> Bool {
        let margenXSeguridadBotonInicio: CGFloat = botonInicio.frame.size.width/2 + Diametro.bola
        let margenYSeguridadBotonInicio: CGFloat = botonInicio.frame.size.height/2 + Diametro.bola
        let minXSeguridad = botonInicio.center.x - margenXSeguridadBotonInicio
        let maxXSeguridad = botonInicio.center.x + margenXSeguridadBotonInicio
        let minYSeguridad = botonInicio.center.y - margenYSeguridadBotonInicio
        let maxYSeguridad = botonInicio.center.y + margenYSeguridadBotonInicio
        let rangoXSeguridad = minXSeguridad..<maxXSeguridad
        let rangoYSeguridad = minYSeguridad..<maxYSeguridad
        if rangoXSeguridad.contains(bolaLanzar.con.vistaImagen.center.x) && rangoYSeguridad.contains(bolaLanzar.con.vistaImagen.center.y)  {
            return true
        }
        return false
    }
    
}
