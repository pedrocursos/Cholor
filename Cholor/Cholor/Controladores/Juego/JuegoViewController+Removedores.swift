// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

// Removedores

extension JuegoViewController {
    
    // MARK: - Bolas
    
    /**
     Remover las bolas de su array.
     */
    func removerBolas() {
        bolas.removeAll()
    }
    
    // MARK: - Elementos UI
    
    /**
     Remover la bola de lanzamiento de la pantalla.
     */
    func removerBolaLanzarDePantalla() {
        bolaLanzar.con.vistaImagen.removeFromSuperview()
    }
    
    /**
     Remover las bolas de la pantalla.
     */
    func removerBolasDePantalla() {
        _ = bolas.map { $0.con.vistaImagen.removeFromSuperview() }
    }
    
    // MARK: - Comportamientos dinámicos
    
    /**
     Elimina todos los comportamientos dinámicos que tiene el *animador*
     */
    func removerComportamientosDinamicos() {
        animador.removeAllBehaviors()
    }
    
    /**
     Elimina el comportamiento de empujar de las bolas.
     */
    func removerComportamientoEmpujarBolas() {
        // 🤔 Opción 1
        /*
         for empujar in empujarArray {
            animador.removeBehavior(empujar)
         }
        */
        // 🤔 Opcion 2
        _ = empujarArray.map { animador.removeBehavior($0) }
        // Vaciar array
        empujarArray.removeAll()
    }
    
}
