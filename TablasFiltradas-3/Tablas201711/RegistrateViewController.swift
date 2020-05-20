//
//  RegistrateViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 22/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI

class RegistrateViewController: UIViewController {

    @IBOutlet weak var Nombre: UITextField!
    @IBOutlet weak var Correo: UITextField!
    @IBOutlet weak var Contrasenia: UITextField!
    var email:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registro(_ sender: Any) {
        
        
        print("HOla")
        guard let email = self.Correo.text, let password = self.Contrasenia.text else {
            print("HOla")
          return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
            let user = authResult?.user
            print("\(user?.email!) created")
        }
        
    }
    
    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: "ingresa2", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        if segue.identifier == "iraingresa" {
            _ = segue.destination as! UINavigationController
        }
        // Pass the selected object to the new view controller.
    }*/
    

}
