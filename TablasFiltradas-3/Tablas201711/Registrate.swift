//
//  Registrate.swift
//  Tablas201711
//
//  Created by Edgar Lopez Valdes on 19/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit

class Registrate: UIViewController {
   
    @IBOutlet weak var contrasenia: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var Nombre: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logact(_ sender: Any) {
    }
    
    @IBAction func RegAct(_ sender: Any) {
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        // Pass the selected object to the new view controller.
    }
    
}
