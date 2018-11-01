// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

extension JuegoViewController {

    // MARK: - Bola en área del Botón de Inicio
    
    /**
     Añade una notificación para observar si la bola de lanzamiento está sobre el área del botón de inicio.
     */
    func añadirBolaEnBotonInicioNotificacion() {
        NotificationCenter.default.addObserver(self, selector: #selector(moverBotonInicio), name: .nombreBolaEnBotonInicioNotificacion, object: nil)
    }
    
    /**
     Mueve el botón de sitio en la pantalla, si observa que la bola de lanzamiento está sobre su área.
     */
    @objc func moverBotonInicio() {
        let centroXPantalla = UIScreen.main.bounds.width / 2
        // El botón de inicio y la bola de lanzamiento están a la derecha
        if botonInicio.center.x > centroXPantalla && bolaLanzar.con.vistaImagen.center.x > centroXPantalla {
            // Mueve el botón de inicio a la izquierda
            let moverXBoton = botonInicio.frame.origin.x - valorRestriccionDerechaBotonInicio
            animarMovimientoBotonInicio(con: restriccionDerechaBotonInicio.constant + moverXBoton)
        } else if botonInicio.center.x < centroXPantalla && bolaLanzar.con.vistaImagen.center.x < centroXPantalla {
            // Mueve el botón de inicio a la derecha
            animarMovimientoBotonInicio(con: valorRestriccionDerechaBotonInicio)
        }
    }
    
}
