// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

@IBDesignable

/// Vista de una circunferencia.
class CircunferenciaView: UIView {
    
    // MARK: - Propiedades
    
    /// Especifica si la celda que contiene a la circunferencia está seleccionada. Si es *true* mostrará un círculo, y si es *false* una circunferencia.
    public var  esSeleccionada: Bool = false
    
    // MARK: Privadas
    
    /// Color de la línea de la circunferencia.
    private let colorLinea: UIColor = .white
    /// Grosor de la línea de la circunferencia.
    private let grosorLinea: CGFloat = 3
    
    // MARK: - Dibujar

    override func draw(_ rect: CGRect) {
        let curva = UIBezierPath(ovalIn: CGRect(x: grosorLinea/2, y: grosorLinea/2, width: rect.size.width - grosorLinea, height: rect.size.height - grosorLinea))
        if esSeleccionada {
            // Rellena el círculo
            colorLinea.setFill()
            curva.fill()
        }
        // Dibuja la circunferencia
        colorLinea.setStroke()
        curva.lineWidth = grosorLinea
        curva.stroke()
    }

}

