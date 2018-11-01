// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

extension UInt32 {
    
    // MARK: - Números aleatorios
    
    /**
     Obtiene un número aleatorio positivo o negativo entre 0 y un número límite.
     
     - returns:
     Devuelve un número aleatorio del tipo *CGFloat* con decimales.
     */
    func valorAleatorioHastaEsteNumero() -> CGFloat {
        let signo: CGFloat = arc4random_uniform(2) == 0 ? 1 : -1
        let entero: CGFloat = CGFloat(arc4random_uniform(self))
        let decimal: CGFloat = CGFloat(drand48())
        return signo * (entero + decimal)
    }
    
    /**
     Obtiene un número aleatorio positivo *CGFloat* entre 0 y un número límite.
     
     - returns:
     Devuelve un número aleatorio del tipo *CGFloat* con decimales.
     */
    func valorAleatorioPositivoHastaEsteNumero() -> CGFloat {
        let entero: CGFloat = CGFloat(arc4random_uniform(self))
        let decimal: CGFloat = CGFloat(drand48())
        return entero + decimal
    }
    
}
