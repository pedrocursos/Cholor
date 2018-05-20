// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

extension CGFloat {
    
    /**
     Devuelve un número aleatorio entre 0 y el número establecido como límite en formato *CGFloat*
     
     - returns:
     Un número aleatorio de formato *CGFloat*
     */
    func valorPositivoHastaEsteNumero() -> CGFloat {
        return CGFloat(abs(UInt32(self).valorAleatorioHastaEsteNumero()))
    }
    
}
