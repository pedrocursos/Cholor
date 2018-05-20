import Foundation

public func ejemplo(de descripcion: String, accion: () -> Void) {
    print("\n🍏 Ejemplo:", descripcion, "🍏")
    accion()
}
