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
import FirebaseStorage
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
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
        
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
         let photoUrl = user.photoURL;
        print(email)
        print(photoUrl)
        print("IHIUHDIUH")
            
        correo.text = email
        //let nom:String = uid+".png"
        
        if(photoUrl != nil){
            let strImage:String = photoUrl!.absoluteString
            var image:UIImage!
            
                // ... your strImage is String  ...
            if let data = NSData(contentsOf: URL(string:strImage )!) {
                image = UIImage(data: data as Data)
                fotoVista.image = image
             }
        }
        
        /*let photoURL = user.photoURL
         var multiFactorString = "MultiFactor: "
         for info in user.multiFactor.enrolledFactors {
           multiFactorString += info.displayName ?? "[DispayName]"
           multiFactorString += " "
         }*/
         // ..
       }
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
        let user = Auth.auth().currentUser
        if let user = user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                let uid = user.uid
                let nom:String = uid+".png"
            let storageRef = Storage.storage().reference().child(nom)
            if(fotoVista.image != nil){
                let compressedImage = fotoVista.image!
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
                                changeRequest?.photoURL = url
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
        
        
    }
    
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
