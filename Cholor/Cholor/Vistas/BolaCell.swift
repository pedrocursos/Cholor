// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

/// Celda que muestra un tipo de bola, especificando su material y peso.
class BolaCell: UITableViewCell {

    // MARK: - Propiedades
    
    /// Vista de una circunferencia.
    @IBOutlet weak var vistaCircunferencia: CircunferenciaView!
    /// Etiqueta con el texto del tipo de bola a elegir en la celda.
    @IBOutlet weak var etiqueta: UILabel!
    
    // MARK: - Ciclo de vida
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Configurar celda
    
    /**
     Configura la apariencia de la celda, generando el texto a mostrar en la celda.
     
     - parameters:
        - bola: valor tipo de la estructura *Bola*.
     */
    func configurarCelda(de bola: DeBolaMaterial) {
        etiqueta.text = "\(bola.nombre.capitalized), peso \(bola.peso) kg"
    }
    
    // MARK: - Selección

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        vistaCircunferencia.esSeleccionada = selected
        vistaCircunferencia.setNeedsDisplay()
        if selected {
            etiqueta.transform = CGAffineTransform(scaleX: 1.0, y: 1.5)
        } else {
            etiqueta.transform = CGAffineTransform.identity
        }
    }

}
