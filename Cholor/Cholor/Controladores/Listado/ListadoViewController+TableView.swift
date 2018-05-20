// Cholor app by Pedro Hernández
// Copyright © 2018 The eMotion Apps.

import UIKit

// TableView

extension ListadoViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Métodos del protocolo UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bolas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BolaCell", for: indexPath) as! BolaCell
        cell.configurarCelda(de: bolas[indexPath.row])
        return cell
    }
    
    // MARK: - Método del protocolo UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let material = bolas[indexPath.row].material
        // Iniciar delegación para pasar el material seleccionado a JuegoViewController
        delegado?.bolaSeleccionada(bolas[indexPath.row])
        // Guardar el material en UserDefaults
        UserDefaults.compartido.guardarMaterial(material)
        // Volver a la pantalla del juego
        self.hero.dismissViewController()
    }
    
}
