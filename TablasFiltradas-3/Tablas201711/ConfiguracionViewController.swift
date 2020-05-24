//
//  ConfiguracionViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 20/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit
import Vision
import Firebase
import FirebaseAuth

class ConfiguracionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var camaraBoton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var fotoVista: UIImageView!
     var handle: AuthStateDidChangeListenerHandle?
    
    private let miPicker = UIImagePickerController()    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            camaraBoton.isHidden = true
        }
        miPicker.delegate = self
       let user = Auth.auth().currentUser
       if let user = user {
         // The user's ID, unique to the Firebase project.
         // Do NOT use this value to authenticate with your backend server,
         // if you have one. Use getTokenWithCompletion:completion: instead.
         let uid = user.uid
         let email = user.email
        print(email)
        print("IHIUHDIUH")
            
        correo.text = email
        /*let photoURL = user.photoURL
         var multiFactorString = "MultiFactor: "
         for info in user.multiFactor.enrolledFactors {
           multiFactorString += info.displayName ?? "[DispayName]"
           multiFactorString += " "
         }*/
         // ..
       }
        
    }
    
    @IBAction func changeMail(_ sender: Any) {
        Auth.auth().currentUser?.updateEmail(to: correo.text!) { (error) in
          // ...
        }
    }
    @IBAction func changePassword(_ sender: Any) {
        Auth.auth().currentUser?.updatePassword(to: password.text!) { (error) in
          // ...
        }
    }
    @IBAction func guardarImagen(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(fotoVista.image!, nil, nil, nil)
    }
    /*
    @IBAction func guardarFoto(_ sender: Any) {
    UIImageWriteToSavedPhotosAlbum(fotoVista.image!, nil, nil, nil)
    }*/
    
    @IBAction func cambiarFoto(_ sender: Any) {
        miPicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(miPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        fotoVista.image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    @IBAction func cierra(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Main")
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true, completion: nil)
    }
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

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
