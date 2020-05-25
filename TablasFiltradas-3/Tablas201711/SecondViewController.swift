//
//  SecondViewController.swift
//  Tablas201711
//
//  Created by molina on 20/02/17.
//  Copyright © 2017 Tec de Monterrey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

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
        let user = Auth.auth().currentUser
        
        if let user = user {
         // The user's ID, unique to the Firebase project.
         // Do NOT use this value to authenticate with your backend server,
         // if you have one. Use getTokenWithCompletion:completion: instead.
         let uid = user.uid
         let email = user.email
         let photoUrl = user.photoURL;
            let display = user.displayName
        print(email)
        print(photoUrl)
        print("IHIUHDIUH")
            
        //correo.text = email
        //let nom:String = uid+".png"
        let nom:String = uid+"ultima.png"
        let storageRef = Storage.storage().reference().child(nom)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
          } else {
            // Data for "images/island.jpg" is returned
            let image = UIImage(data: data!)
            self.imagen.image = image
          }
        }
        if(display != nil){
            Promo.text = display
        }// Do any additional setup after loading the view, typically from a nib.
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

