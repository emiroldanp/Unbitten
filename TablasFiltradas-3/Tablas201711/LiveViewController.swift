//
//  LiveViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 21/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit
import FirebaseAuth

class LiveViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    var imagen:UIImage!
    //var localT:String
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var local: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = imagen
        //local.text = localT
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
