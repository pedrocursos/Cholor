//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ## Dibujar

import UIKit
import PlaygroundSupport

// Fondo para la previsualización
let fondo = FondoView(recuadro: CGRect(x: 0, y: 0, width: 300, height: 500), color: .orange)
PlaygroundPage.current.liveView = fondo

// Clase para crear un vista que tendrá dibujada una circunferencia o un círculo.
// Esta clase dibuja el círculo al simular si una celda ha sido seleccionada, si no dibuja la circunferencia.
class CircunferenciaView: UIView {
    
    public var  esSeleccionadaLaCelda: Bool = false
    private let colorLinea: UIColor = .white
    private let grosorLinea: CGFloat = 3
    
    override func draw(_ rect: CGRect) {
        // Crear un óvalo, que por las dimensiones será un círculo
        let curva = UIBezierPath(ovalIn:
            CGRect(x: grosorLinea/2,
                   y: grosorLinea/2,
                   width: rect.size.width - grosorLinea,
                   height: rect.size.height - grosorLinea))
        if esSeleccionadaLaCelda {
            // Dibujar un círculo
            // Establecer el color para rellenar el círculo
            colorLinea.setFill()
            // Rellenar el círculo
            curva.fill()
        }
        // Dibujar una circunferencia
        // Establecer el color para pintar la línea de la curva
        colorLinea.setStroke()
        // Grosor de la línea de la curva
        curva.lineWidth = grosorLinea
        // Pintar la línea en pantalla
        curva.stroke()
    }
}

// Instancia a la vista
let circunferencia = CircunferenciaView(frame:
    CGRect(x: 100,
           y: 50,
           width: 100,
           height: 100))
// Circunferencia con el fondo transparente
circunferencia.backgroundColor = .clear
// Añadir al fondo la vista de la circunferencia
fondo.addSubview(circunferencia)
// La celda está seleccionada
circunferencia.esSeleccionadaLaCelda = true
circunferencia.setNeedsDisplay()
// La celda NO está seleccionada
circunferencia.esSeleccionadaLaCelda = false
circunferencia.setNeedsDisplay()
