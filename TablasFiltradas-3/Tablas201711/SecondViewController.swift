//
//  SecondViewController.swift
//  Tablas201711
//
//  Created by molina on 20/02/17.
//  Copyright © 2017 Tec de Monterrey. All rights reserved.
//

import UIKit
import FirebaseAuth

class SecondViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    var image:UIImage!
    var promo:String!
    @IBOutlet weak var Promo: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagen.image = image
        Promo.text = promo
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

