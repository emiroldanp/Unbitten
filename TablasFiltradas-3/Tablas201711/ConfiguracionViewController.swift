//
//  ConfiguracionViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 20/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit

class ConfiguracionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        //_ = segue.destination as! MainViewController
        if segue.identifier == "metododepago" {
            _ = segue.destination as! PagoViewController
        // Pass the selected object to the new view controller.
        } else if segue.identifier == "cierresesion" {
            _ = segue.destination as! MainViewController
        }
    }
    

}
