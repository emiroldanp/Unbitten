//
//  ChangePicViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 09/05/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChangePicViewController: UIViewController {
     var handle: AuthStateDidChangeListenerHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
