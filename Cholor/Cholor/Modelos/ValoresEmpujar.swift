// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

/// Estructura con los valores de un comportamiento de empuje (*UIPushBehavior*)
struct ValoresEmpujar: Empujable {
    
    // MARK: - Propiedades del protoclo *Empujable*
    
    var magnitud: CGFloat
    var direccion: CGVector
    
    // MARK: - Inicialización
    
    init(color: ColorBola, material: Material) {
        
        switch material {
        case .madera:
            self.direccion = CGVector(dx: UInt32(5).valorAleatorioHastaEsteNumero(), dy:  UInt32(5).valorAleatorioHastaEsteNumero())
            if color == .naranja {
                self.magnitud = UInt32(2).valorAleatorioPositivoHastaEsteNumero()
            } else if color == .negro {
                self.magnitud = 0
            } else {
                self.magnitud = UInt32(10).valorAleatorioPositivoHastaEsteNumero()
            }
        case .acero:
            self.direccion = CGVector(dx: UInt32(5).valorAleatorioHastaEsteNumero(), dy:  UInt32(5).valorAleatorioHastaEsteNumero())
            if color == .naranja {
                self.magnitud = UInt32(2).valorAleatorioPositivoHastaEsteNumero()
            } else if color == .negro {
                self.magnitud = 0
            } else {
                self.magnitud = UInt32(10).valorAleatorioPositivoHastaEsteNumero()
            }
        case .plastico:
            self.direccion = CGVector(dx: UInt32(5).valorAleatorioHastaEsteNumero(), dy:  UInt32(5).valorAleatorioHastaEsteNumero())
            if color == .naranja {
                self.magnitud = UInt32(2).valorAleatorioPositivoHastaEsteNumero()
            } else if color == .negro {
                self.magnitud = 0
            } else {
                self.magnitud = UInt32(10).valorAleatorioPositivoHastaEsteNumero()
            }
        case .piedra:
            self.direccion = CGVector(dx: UInt32(5).valorAleatorioHastaEsteNumero(), dy:  UInt32(5).valorAleatorioHastaEsteNumero())
            if color == .naranja {
                self.magnitud = UInt32(2).valorAleatorioPositivoHastaEsteNumero()
            } else if color == .negro {
                self.magnitud = 0
            } else {
                self.magnitud = UInt32(10).valorAleatorioPositivoHastaEsteNumero()
            }
        case .esponja:
            self.direccion = CGVector(dx: UInt32(5).valorAleatorioHastaEsteNumero(), dy:  UInt32(5).valorAleatorioHastaEsteNumero())
            if color == .naranja {
                self.magnitud = UInt32(2).valorAleatorioPositivoHastaEsteNumero()
            } else if color == .negro {
                self.magnitud = 0
            } else {
                self.magnitud = UInt32(10).valorAleatorioPositivoHastaEsteNumero()
            }
        }
    }
}
