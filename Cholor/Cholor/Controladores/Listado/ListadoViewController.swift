// Cholor app by Pedro Hernández
// Copyright © 2017 The eMotion Apps.


import UIKit

protocol ListadoDelegado {
    /**
     Método por delegación del protocolo *ListadoDelegado* que transmite el material de la bola seleccionada en el listado.
     
     - parameters:
        - bola: características sobre el material de la bola seleccionada para el juego.
     */
    func bolaSeleccionada(_ bola: DeBolaMaterial)
}

/// Clase que correponde con la Pantalla de Listado las bolas.
class ListadoViewController: UIViewController {
    
    //  MARK: - Propiedades globales
    
    /// Array con los tipos de bolas para el listado
    var bolas = [DeBolaMaterial]()
    /// Delegado del listado
    var delegado: ListadoDelegado?
    
    // MARK: - Ciclo de vida

    override func viewDidLoad() {
        super.viewDidLoad()

        iniciarBolas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
