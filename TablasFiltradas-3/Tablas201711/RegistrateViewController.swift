//
//  RegistrateViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 22/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit

class RegistrateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "ingresa2" {
            _ = segue.destination as! FirstViewController
        // Pass the selected object to the new view controller.
        } else if segue.identifier == "iraingresa" {
            _ = segue.destination as! UINavigationController
        }
        // Pass the selected object to the new view controller.
    }
    

}
