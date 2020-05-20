//
//  DetalleViewController.swift
//  Tablas201711
//
//  Created by molina on 23/02/17.
//  Copyright © 2017 Tec de Monterrey. All rights reserved.
//

import UIKit
import FirebaseAuth

class DetalleViewController: UIViewController {

    var marca:String="VW"
    var precio:String=""
    var imagen:UIImage!
    var descripcion:String=""
    var promocion:String=""
     var handle: AuthStateDidChangeListenerHandle?
    //var UIImageView
    @IBOutlet weak var laPrecio: UILabel!
    @IBOutlet weak var laDescripcion: UILabel!
    @IBOutlet weak var laMarca: UILabel!
    @IBOutlet weak var laPromocion: UILabel!
    @IBOutlet weak var laImagen: UIImageView!
    
    //@IBOutlet weak var laDescripcion: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
        }
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
        
        //siguienteVista.localT = laMarca.text ?? <#default value#>
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "comprar" {
            let siguienteVista = segue.destination as! CompraViewController
            siguienteVista.imagen = laImagen.image
            siguienteVista.precio = precio
            siguienteVista.promo = promocion
            siguienteVista.desc = descripcion
            siguienteVista.marca = marca
            //siguienteVista.imagen = laImagen.image
            
            //_ = segue.destination as!
        // Pass the selected object to the new view controller.
        } else if segue.identifier == "liveview" {
            let siguienteVista = segue.destination as! LiveViewController
            siguienteVista.imagen = laImagen.image
            //_ = segue.destination as!
            
        }
        // Pass the selected object to the new view controller.
    }
    

}
