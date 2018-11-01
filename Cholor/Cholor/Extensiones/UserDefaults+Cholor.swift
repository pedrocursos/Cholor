// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import Foundation

/// Claves para obtener el nivel y los puntos guardados en *UserDefaults*
enum ClaveUserDefaults: String {
    case nivel, puntos, material
}

/// Protocolo para compartir la instancia de *UserDefaults*
protocol DefaultsCompartible {
    static var compartido: UserDefaults { get }
}

extension UserDefaults: DefaultsCompartible {
    
    // MARK: - Compartido
    
    static var compartido = UserDefaults()
    
    // MARK: - Escribir
    
    // MARK: Nivel
    
    /**
     Guarda el nivel del juego en *UserDefaults*
     
     - parameters:
     - nivel: número con el último nivel jugado por el usuario.
     */
    func guardarNivel(_ nivel: Int) {
        UserDefaults.standard.set(nivel, forKey: ClaveUserDefaults.nivel.rawValue)
    }
    
    /**
     Guarda el nivel del juego en *UserDefaults*
     
     - parameters:
     - nivel: número con el último nivel jugaddo por el usuario.
     */
    func guardaNivel(_ nivel: String) {
        UserDefaults.standard.set(nivel, forKey: ClaveUserDefaults.nivel.rawValue)
    }
    
    // MARK: Puntuación
    
    /**
     Guarda la puntuación del juego en *UserDefaults*
     
     - parameters:
     - puntos: número con los puntos obtenidos en el juego.
     */
    func guardarPuntuacion(_ puntos: Int) {
        UserDefaults.standard.set(puntos, forKey: ClaveUserDefaults.puntos.rawValue)
    }
    
    /**
     Guarda la puntuación del juego en *UserDefaults*
     
     - parameters:
     - puntos: número con los puntos obtenidos en el juego.
     */
    func guardarPuntuacion(_ puntos: String) {
        UserDefaults.standard.set(puntos, forKey: ClaveUserDefaults.puntos.rawValue)
    }
    
    // MARK: Material
    
    /**
     Guarda el material de la bola en *UserDefaults*
     
     - parameters:
     - material: el material del que está hecho la bola.
     */
    func guardarMaterial(_ material: Material) {
        UserDefaults.standard.set(material.description, forKey: ClaveUserDefaults.material.rawValue)
    }
    
    // MARK: - Leer
    
    // MARK: Nivel
    
    /**
     Obtiene el número del nivel guardado en *UserDefaults* en formato *String*.
     
     - returns:
     Número del nivel del juego.
     */
    func obtenerNivel() -> String {
        return String(UserDefaults.standard.integer(forKey: ClaveUserDefaults.nivel.rawValue))
    }
    
    /**
     Obtiene el número del nivel guardado en *UserDefaults* en formato *String*.
     
     - returns:
     Número del nivel del juego.
     */
    func obtenerNivel() -> Int {
        return UserDefaults.standard.integer(forKey: ClaveUserDefaults.nivel.rawValue)
    }
    
    // MARK: Puntuación
    
    /**
     Obtiene el número con los puntos guardados en *UserDefaults* en formato *String*.
     
     - returns:
     Número con los puntos obtenidos en el juego.
     */
    func obtenerPuntuacion() -> String {
        return String(UserDefaults.standard.integer(forKey: ClaveUserDefaults.puntos.rawValue))
    }
    
    // MARK: Material
    
    /**
     Obtiene el material de la bola en *UserDefaults* en formato *String*.
     
     - returns:
     El material de la bola.
     */
    func obtenerMaterial() -> Material {
        guard let texto = UserDefaults.standard.string(forKey: ClaveUserDefaults.material.rawValue) else {
            return .madera
        }
        switch texto {
        case "madera":
            return .madera
        case "acero":
            return .acero
        case "plástico":
            return .plastico
        case "piedra":
            return .piedra
        case "esponja":
            return .esponja
        default:
            return .madera
        }
    }
    
}
