//
//  CompraViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 20/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit

class CompraViewController: UIViewController {
    
    var imagen:UIImage!
    var precio:String = ""
    var marca:String = ""
    var desc:String = ""
    var promo:String = ""
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var Promo: UILabel!
    @IBOutlet weak var Precio: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = imagen
        Promo.text = promo
        Precio.text = precio
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "Confirmar" {
            let siguienteVista = segue.destination as! SecondViewController
            siguienteVista.image = imagen
            siguienteVista.promo = promo
            //siguienteVista.imagen = laImagen.image
            
            //_ = segue.destination as!
        // Pass the selected object to the new view controller.
        } else if segue.identifier == "Cancelar" {
            let siguienteVista = segue.destination as! DetalleViewController
            siguienteVista.imagen = imagen
            siguienteVista.precio = precio
            siguienteVista.promocion = promo
            siguienteVista.marca = marca
            siguienteVista.descripcion = desc
            
            //_ = segue.destination as!
            
        }
        // Pass the selected object to the new view controller.
    }
    

}
