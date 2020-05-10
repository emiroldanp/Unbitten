//
//  DetalleViewController.swift
//  Tablas201711
//
//  Created by molina on 23/02/17.
//  Copyright © 2017 Tec de Monterrey. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {

    var marca:String="VW"
    var precio:String=""
    var imagen:UIImage!
    var descripcion:String=""
    var promocion:String=""
    
    //var UIImageView
    @IBOutlet weak var laPrecio: UILabel!
    @IBOutlet weak var laDescripcion: UILabel!
    @IBOutlet weak var laMarca: UILabel!
    @IBOutlet weak var laPromocion: UILabel!
    @IBOutlet weak var laImagen: UIImageView!
    
    //@IBOutlet weak var laDescripcion: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        laPrecio.text = precio
        laPromocion.text = promocion
        laDescripcion.text = descripcion
        laImagen.image = imagen
        laMarca.text = marca
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVista = self.storyboard?.instantiateViewController(withIdentifier: "LiveView") as! LiveViewController
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "comprar" {
            _ = segue.destination as! CompraViewController
        // Pass the selected object to the new view controller.
        } else if segue.identifier == "liveview" {
            _ = segue.destination as! LiveViewController
            siguienteVista.imagen = imagen
        }
        // Pass the selected object to the new view controller.
    }
    

}
