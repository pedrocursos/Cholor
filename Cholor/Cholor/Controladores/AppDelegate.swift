// Cholor app by Pedro Hernández
// Copyright © 2017 The eMotion Apps.

import UIKit
import AudioKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Propiedades globales para la aplicación

    var window: UIWindow?
    
    /// Reproductor con la música de fondo para el juego.
    var musicaFondoReproductor: AKAudioPlayer!
    /// Reproductor para escuchar el sonido al pulsar el botón de jugar.
    var botonJugarReproductor: AKAudioPlayer!
    /// Reproductor para escuchar la colisión de la bola de lanzamiento con otra bola.
    var colisionBolasReproductor: AKAudioPlayer!
    /// Reproductor para escuchar la colisión de la bola con los límites del área de juego.
    var colisionParedReproductor: AKAudioPlayer!
    /// Reproductor para escuchar la colisión entre las dos bolas naranjas.
    var colisionBolasNaranjasReproductor: AKAudioPlayer!
    /// Reproductor para escuchar la colisión entre la bola de lanzamiento y la bola negra.
    var colisionConBolaNegraReproductor: AKAudioPlayer!
    /// Reproductor para escuchar el sonido para pasar al siguiente nivel.
    var siguienteNivelReproductor: AKAudioPlayer!
    /// Mezclador para todos los reproductores.
    var mezclador: AKMixer!
    /// Volumen inicial del reproductor de música de fondo.
    let volumenInicial: Double = 1
    
    // MARK: - Ciclo de vida de la aplicación.

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if mezclador == nil {
            // Inicializa el mezclador al iniciarse la aplicación
            iniciarMezcladorMusical()
        } else {
            // Inicia el play, si ya está creado el mezclador
            do {
                try AudioKit.start()
            } catch {
                print("Se ha producido un error al iniciar el motor de AudioKit")
            }
            mezclador.play()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Detiene la música de fondo, si la aplicación se vuelve inactiva al recibir una llamada de teléfono, un mensaje, etc.
        if mezclador.isPlaying {
            mezclador.stop()
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Detiene la música de fondo, si la aplicación se va al background, es decir, si en un iPhone se pulsa el botón Home.
        if mezclador.isPlaying {
            mezclador.stop()
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Inicia la música de fondo, si la aplicación vuelve al primer plano desde el background, es decir, si en un iPhone el usuario, pulsando dos veces en el botón Home, vuelve a poner en pantalla la aplicación.
        if mezclador.isStopped {
            mezclador.play()
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Inicia la música de fondo, si la aplicación fue pausada y no se ha iniciado todavía.
        if mezclador.isStopped {
            mezclador.play()
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Detiene la música de fondo, cuando la aplicación termina.
        if mezclador.isPlaying {
            mezclador.stop()
        }
        do {
            try AudioKit.stop()
        } catch {
            print("Se ha producido un error al apagar el motor de AudioKit")
        }
    }
    
    // MARK: - Compartido
    
    /**
     Función de utilidad estática para acceder a las propiedades públicas de la clase.

     - returns:
     Devuelve una instancia para manejar las propiedades de la clase *AppDelegate*.
     */
    static func compartido() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    // MARK: - AudioKit

    /**
     Inicializa el mezclador de música que contine todos los audios usados en la aplicación.
     */
    func iniciarMezcladorMusical() {
        // Crear reproductores
        do {
            // Archivos de sonido
            let musicaFondoArchivo = try AKAudioFile(readFileName: "Cholor.m4a")
            let botonJuegoArchivo = try AKAudioFile(readFileName: "Boton-Jugar.m4a")
            let bolaGolpeandoParedArchivo = try AKAudioFile(readFileName: "Bola-Golpeando-Pared.m4a")
            let choqueBolasArchivo = try AKAudioFile(readFileName: "Choque-Bolas.m4a")
            let choqueBolaNegraArchivo = try AKAudioFile(readFileName: "Bola-Negra.m4a")
            let finPartidaArchivo = try AKAudioFile(readFileName: "Fin-Partida.m4a")
            let siguienteNivelArchivo = try AKAudioFile(readFileName: "Nuevo-Nivel.m4a")
            // Reproductores
            musicaFondoReproductor = try AKAudioPlayer(file: musicaFondoArchivo)
            botonJugarReproductor = try AKAudioPlayer(file: botonJuegoArchivo)
            colisionBolasReproductor = try AKAudioPlayer(file: choqueBolasArchivo)
            colisionParedReproductor = try AKAudioPlayer(file: bolaGolpeandoParedArchivo)
            colisionBolasNaranjasReproductor = try AKAudioPlayer(file: finPartidaArchivo)
            colisionConBolaNegraReproductor = try AKAudioPlayer(file: choqueBolaNegraArchivo)
            siguienteNivelReproductor = try AKAudioPlayer(file: siguienteNivelArchivo)
            // Establecer si se repite indefinidamente el audio
            musicaFondoReproductor.looping = true
            // Volumen de los reproductores
            musicaFondoReproductor.volume = volumenInicial
            botonJugarReproductor.volume = volumenInicial + 1
            colisionBolasReproductor.volume = volumenInicial
            colisionParedReproductor.volume = volumenInicial - 0.8
            colisionBolasNaranjasReproductor.volume = volumenInicial + 0.5
            colisionConBolaNegraReproductor.volume = volumenInicial + 0.5
            siguienteNivelReproductor.volume = volumenInicial + 0.5
        } catch {
            print(error)
        }
        // Crear el mezclador de música
        mezclador = AKMixer(musicaFondoReproductor, botonJugarReproductor, colisionBolasReproductor, colisionParedReproductor, colisionBolasNaranjasReproductor, colisionConBolaNegraReproductor, siguienteNivelReproductor)
        // Inicialización del motor de AudioKit
        AudioKit.output = mezclador
        do {
            try AudioKit.start()
        } catch {
            print("Se ha producido un error al iniciar el motor de AudioKit")
        }
    }

}

