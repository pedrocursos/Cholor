//
//  ViewController.swift
//  Cholor
//
//  Created by Cursos on 11/10/18.
//  Copyright © 2018 The eMotion Apps. All rights reserved.
//

import UIKit
import AVFoundation
import Hero

/// Clase que correponde con la Pantalla de Inicio.
class InicioViewController: UIViewController {
    
    // MARK: - Propiedades
    
    // MARK: Elementos UI
    
    /// Este botón inicia el juego.
    @IBOutlet weak var botonJugar: UIButton!
    
    // MARK: - Ciclo de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iniciarReproductor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Volver a establecer el volumen original de la música de fondo
        guard let fondoReproductor = AppDelegate.compartido().musicaFondoReproductor else { return }
        let volumen = AppDelegate.compartido().volumenInicial != 0 ? AppDelegate.compartido().volumenInicial : 1
        if fondoReproductor.volume < volumen {
            fondoReproductor.volume = volumen
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

