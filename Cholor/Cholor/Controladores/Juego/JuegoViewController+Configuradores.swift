// Cholor app by Pedro Hernández
// Copyright © 2017 The eMotion Apps.

import UIKit

// Configuradores

extension JuegoViewController {
    
    // MARK: - Bolas
    
    /**
     Coloca la bola de lanzamiento en la posición deseada en la pantalla.
     */
    func configurarPosicionBolaLanzar() {
        bolaLanzar.con.vistaImagen.center = CGPoint(x: vistaAreaJuego.center.x, y: vistaAreaJuego.frame.size.height - (Diametro.bola - 20))
    }
    
    /**
     Muestra las bolas en el área de juego de forma aleatoria.
     
     - Important:
     La bola para lanzar está excluida en este método.
     */
    func configurarPosicionBolas() {
        // 🤔 Opción 1
        /*
        bolas.forEach { bola in
            let centroX = vistaAreaJuego.bounds.size.width.valorPositivoHastaEsteNumero()
            var centroY = botonInicio.frame.origin.y.valorPositivoHastaEsteNumero()
            if bola.con.color == .naranja {
                centroY = CGFloat(Diametro.bola * 2).valorPositivoHastaEsteNumero()
            }
            bola.con.vistaImagen.center = CGPoint(x: centroX, y: centroY)
            print("🎾 \(bola.con.vistaImagen.center)")
        }
         */
        // Posición bolas
        _ = bolas
            .filter {
                ($0.con.color != .naranja)
            }
            .map {
                $0.con.vistaImagen.center = CGPoint(
                    x: vistaAreaJuego.bounds.size.width.valorPositivoHastaEsteNumero(),
                    y: botonInicio.frame.origin.y.valorPositivoHastaEsteNumero()
                )
                print("🎾 \($0.con.vistaImagen.center)")
        }
        // Posición bola naranja
        _ = bolas
            .filter {
                $0.con.color == .naranja
            }
            .map {
                $0.con.vistaImagen.center = CGPoint(
                    x: vistaAreaJuego.bounds.size.width.valorPositivoHastaEsteNumero(),
                    y: CGFloat(Diametro.bola * 2).valorPositivoHastaEsteNumero()
                )
                print("🎾 \($0.con.vistaImagen.center)")
        }
    }
    
    // MARK: - Etiquetas
    
    /**
     Configura los números para el nivel y la puntuación en el marcador.
     */
    func configurarMarcador() {
        etiquetaMarcadorNivel.text = UserDefaults.compartido.obtenerNivel()
        etiquetaMarcadorPuntos.text = UserDefaults.compartido.obtenerPuntuacion()
    }
    
    /**
     Configura como oculta la etiqueta con el número grande de paso al siguiente nivel.
     */
    func configurarEtiquetaSiguienteNivel() {
        if etiquetaSiguienteNivel.isHidden == false {
            etiquetaSiguienteNivel.isHidden = true
        }
        etiquetaSiguienteNivel.center = vistaAreaJuego.center
    }
    
}
