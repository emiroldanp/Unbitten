//
//  CompraViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 20/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import LocalAuthentication

class CompraViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    var imagen:UIImage!
    var precio:String = ""
    var marca:String = ""
    var desc:String = ""
    var promo:String = ""
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var Promo: UILabel!
    @IBOutlet weak var Precio: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = imagen
        Promo.text = promo
        Precio.text = precio
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
        }
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    @IBAction func confirmar(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "pedid")
        vc!.modalPresentationStyle = .fullScreen
        
        let user = Auth.auth().currentUser
                   if let user = user {
                           // The user's ID, unique to the Firebase project.
                           // Do NOT use this value to authenticate with your backend server,
                           // if you have one. Use getTokenWithCompletion:completion: instead.
                           let uid = user.uid
                           let nom:String = uid+"ultima.png"
                       let storageRef = Storage.storage().reference().child(nom)
                       if(self.image.image != nil){
                           let compressedImage = self.image.image!
                           if let uploadData = compressedImage.pngData(){
                               storageRef.putData(uploadData, metadata: nil, completion: {(metadata,error) in //self.hideActivityIndicator(view:self.view)
                                   if error != nil{
                                       //self.writeDatabaseCustomer()
                                       print("error")
                                       return
                                   }else{
                                       let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                                       storageRef.downloadURL(completion: {(url, error) in
                                           print("Image URL: \((url?.absoluteString)!)")
                                           changeRequest?.displayName = self.Promo.text
                                           changeRequest?.commitChanges { (error) in
                                             // ...
                                           }
                                           //self.writeDatabaseCustomer(imageUrl: (url?.absoluteString)!)
                                       })
                                   }
                               })
                           }
                       }
                   }
        let context = LAContext()
        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return print(error)
        }

        let reason = "Face ID "
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { isAuthorized, error in
            guard isAuthorized == true else {
                return print(error)
            }
            
            //self.performSegue(withIdentifier: "comp", sender: self.navigationController)
            DispatchQueue.main.async {
                self.present(vc!, animated: true, completion: nil)
                //self.imageView.image = image
            }
            print("success")
           
            //self.present(vc!, animated: true, completion: nil)
        }
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "Confirmar" {
            
            
        
        
            //siguienteVista.si = 1;
            //firebase.analytics().setUserProperties({Ultima: 'apples'});
            //siguienteVista.imagen = laImagen.image
            
            //_ = segue.destination as!
        // Pass the selected object to the new view controller.
        } else if segue.identifier == "Cancelar" {
            let siguienteVista = segue.destination as! DetalleViewController
            siguienteVista.imagen = imagen
            siguienteVista.precio = precio
            siguienteVista.promocion = promo
            siguienteVista.marca = marca
            siguienteVista.descripcion = desc
            
            //_ = segue.destination as!
            
        }
        // Pass the selected object to the new view controller.
    }
    

}
