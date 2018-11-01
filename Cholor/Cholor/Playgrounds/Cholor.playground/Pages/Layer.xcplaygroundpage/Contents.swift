//: [Tabla de Contenidos](Tabla%20de%20Contenidos)
//: ### Layer

import UIKit
import PlaygroundSupport

// Fondo previsualización
let fondo = FondoView(recuadro: CGRect(x: 0, y: 0, width: 300, height: 300), color: UIColor(displayP3Red: 41/255, green: 171/255, blue: 226/255, alpha: 1))
PlaygroundPage.current.liveView = fondo

// Crear image view y su apariencia
let diametro: CGFloat = 80
let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: diametro, height: diametro))
imageView.layer.cornerRadius = diametro / 2
imageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
imageView.backgroundColor = UIColor.yellow
imageView.center = fondo.center
fondo.addSubview(imageView)

// Añadir imagen de la bola en una layer
let bolaLayer = CALayer()
let imagenBola = UIImage(named: "Bola-Naranja-Con-Sombra-126x126@3x")
let imagenBolaConEstela = UIImage(named: "Bola-Naranja-Con-Estela-270x270@3x")
// Calcula la anchura en relación a las proporciones originales del diseño
let tamaño: CGFloat = (126 * diametro) / 80
let desplazamiento: CGFloat = (23 * diametro) / 80
let bolaRect = CGRect(x: -desplazamiento, y: -desplazamiento, width: tamaño, height: tamaño)
bolaLayer.frame = bolaRect
bolaLayer.contentsScale = 3
// Añadir imagen de bola naranja
//bolaLayer.contents = imagenBola?.cgImage
//Añadir imagen de bola de lanzamiento (con estela)
bolaLayer.contents = imagenBolaConEstela?.cgImage
bolaLayer.contentsGravity = CALayerContentsGravity.center
// Añadir nueva layer a la imageView
imageView.layer.addSublayer(bolaLayer)
