// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

/// Vista de la imagen de la bola.
final class BolaImageView: UIImageView, Igualable {
    
    // MARK: - Propiedades globales
    
    /// Color de la bola basado en la enumeración *ColorBola*
    private var colorBola: ColorBola = .naranja
    
    // MARK: - Inicialización
    
    init() {
        super.init(frame: .zero)
    }
    
    /**
     Crear la bola.
     
     - parameters:
     - diametro: corresponde con el diámetro de la bola.
     - imagen: es la imagen asignada al *contents* de la layer.
     - Important:
     El tamaño de la vista corresponde con el diámetro pasado como parámetro. Esto es muy importante para los comportamientos dinámicos. Por lo tanto, la apariencia de la bola es asignada en un layer. Así no afecta el tamaño de la imagen a los comportamientos dinámicos.
     */
    convenience init(de diametro: CGFloat, con imagen: UIImage, del color: ColorBola) {
        self.init()
        
        // Crea la imageView y su apariencia
        self.frame = CGRect(x: 0, y: 0, width: diametro, height: diametro)
        self.layer.cornerRadius = diametro / 2
        self.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        colorBola = color
        // Añadir la imagen de la bola en una layer
        let bolaLayer = CALayer()
        // Calcula la anchura en relación a las proporciones originales del diseño
        let tamaño: CGFloat = (126 * diametro) / 80
        let desplazamiento: CGFloat = (23 * diametro) / 80
        let bolaRect = CGRect(x: -desplazamiento, y: -desplazamiento, width: tamaño, height: tamaño)
        bolaLayer.frame = bolaRect
        bolaLayer.contentsScale = UIScreen.main.scale
        bolaLayer.contents = imagen.cgImage
        bolaLayer.contentsGravity = CALayerContentsGravity.center
        self.layer.addSublayer(bolaLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) no ha sido implementado")
    }
    
    // MARK: - Imagen
    
    /**
     Asigna una imagen al *contents* de la layer.
     */
    func asignarAlLayer(una imagen: UIImage) {
        guard let sublayers = self.layer.sublayers else { return }
        guard let bolaLayer = sublayers.first else { return }
        bolaLayer.contents = imagen.cgImage
        bolaLayer.contentsScale = UIScreen.main.scale
    }
    
    // MARK: - Color bola
    
    /**
     Devuelve el color de la bola, basado en la enumeración *ColorBola*
     
     - returns:
     Color de la bola.
     */
    func obtenerColorBola() -> ColorBola {
        return self.colorBola
    }
    
    // MARK: - Protocolo Igualable
    
    func esColisionBolaLanzar(con otraBola: BolaImageView, de color: ColorBola) -> Bool {
        return
            (self.obtenerColorBola() == color && otraBola.obtenerColorBola() == .naranjaLanzar)
                ||
                (self.obtenerColorBola() == .naranjaLanzar && otraBola.obtenerColorBola() == color)
    }
    
}
