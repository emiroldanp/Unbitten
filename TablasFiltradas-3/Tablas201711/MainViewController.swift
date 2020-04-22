//
//  MainViewController.swift
//  Tablas201711
//
//  Created by Edgar Lopez Valdes on 19/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var RegistrateBtn: UIButton!
    @IBOutlet weak var LoginLabel: UILabel!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var Ingresa: UIButton!
    @IBOutlet weak var contrasenia: UITextField!
    @IBOutlet weak var usuario: UITextField!
    
    
    @IBAction func login(_ sender: Any) {
    }
    
    @IBAction func RegistrateAction(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        if segue.identifier == "ingresa" {
            _ = segue.destination as! FirstViewController
        // Pass the selected object to the new view controller.
        } else if segue.identifier == "registro" {
            _ = segue.destination as! RegistrateViewController
        }
        // Pass the selected object to the new view controller.
    }
    

}



