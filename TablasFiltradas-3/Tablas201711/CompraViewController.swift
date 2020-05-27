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
        
        let user = Auth.auth().currentUser
        if let user = user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                let uid = user.uid
                let nom:String = uid+"ultima.png"
            let storageRef = Storage.storage().reference().child(nom)
            if(image.image != nil){
                let compressedImage = image.image!
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
        
        let context:LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "¿Desea confirmar el pedido?") { (good, error) in
                if good {
                    print("GOOD")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompraV")
                    //vc!.modalPresentationStyle = .fullScreen
                    //self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    print("TRY AGAIN")
                    
                }
            }
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
