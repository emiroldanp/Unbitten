//
//  MainViewController.swift
//  Tablas201711
//
//  Created by Edgar Lopez Valdes on 19/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MainViewController: UIViewController {
    
    
    
    @IBOutlet weak var loginEmailField: UITextField!
    @IBOutlet weak var loginPasswordField: UITextField!
    
    var signed:Int?
    var email:String?
    var password:String?
    
   
    @IBOutlet weak var registrate: UIButton!
    
    
    @IBAction func registro(_ sender: Any) {
        //1.
        let alert = UIAlertController(title: "Nuevo Usuario",
                                      message: "Introduce tus datos por favor",
                                      preferredStyle: .alert)
        //2.
        let saveAction = UIAlertAction(title: "Guardar",
                                       style: .default) { action in
                                        let emailField = alert.textFields![0]
                                        let passwordField = alert.textFields![1]
                                        //3.
                                        Auth.auth().createUser(withEmail: emailField.text!,
                                                                   password: passwordField.text!) { user, error in
                                        }
                                        print(emailField.text)
                                        print(passwordField.text)
        }
        //4.
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default)
        //5.
        alert.addTextField { textEmail in
            textEmail.placeholder = "email"
        }
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "contraseña"
        }
        //6.
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        //7.
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func ingresa(_ sender: Any) {
        //1.
                if self.loginEmailField.text == "" || self.loginPasswordField.text == "" {
                    let alertController = UIAlertController(title: "Error", message: "Por favor introduce email y contraseña", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                } else {
                //2.
                    var user = Auth.auth().currentUser?.uid;
                    print("HOLAAAA")
                    print(user)
                    
                    if(user != nil){
                        
                            let firebaseAuth = Auth.auth()
                        do {
                          try firebaseAuth.signOut()
                        } catch let signOutError as NSError {
                          print ("Error signing out: %@", signOutError)
                        }
                        
                    }
                            
                        // User is signed in.
                      
                    
                    
                    guard let email = self.loginEmailField.text, let password = self.loginPasswordField.text else {
                        print("HOla")
                      return
                    }
                    
                    print(email)
                    print(password)
                    
                    /*if(email == "marcevc77@gmail.com" && password=="123456"){
                        print("HEY")
                    }
                    
                    Auth.auth().signIn(withEmail: "marcevc77@gmail.com", password: ""123456"") { authResult, error in
                      // ...
                        print(error)
                        if(error == nil){
                            print("successful login")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                            self.present(vc!, animated: true, completion: nil)
                            user = Auth.auth().currentUser?.uid;
                        }
                        
                    }*/
                    
                    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                //3.
                        /*Auth.auth().signIn(withEmail: "x@x.mx",
                                            password: "123456") { (user, error) in

                            if error == nil {
                                print("successful login")
                            }

                        }*/
                        
                        print(user)
                        if error == nil {
                            print("successful login")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                            vc!.modalPresentationStyle = .fullScreen
                            self.present(vc!, animated: true, completion: nil)
                            
                        } else {
                //4.
                            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                            
                            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
                            
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
        }
    }

    @IBAction func login(_ sender: Any) {
    }
    
    @IBAction func RegistrateAction(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        signed = 0
        // Do any additional setup after loading the view.
        loginEmailField.placeholder = "correo"
        loginPasswordField.placeholder = "contraseña"
        loginPasswordField.isSecureTextEntry = true
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if "ingresar" == segue.identifier {
            // Nothing really to do here, since it won't be fired unless
            // shouldPerformSegueWithIdentifier() says it's ok. In a real app,
            // this is where you'd pass data to the success view controller.
        }
        else if segue.identifier == "registro" {
            _ = segue.destination as! RegistrateViewController
        } else if segue.identifier == "about" {
             _ = segue.destination as! AcercaDeViewController
        }
    }
    

}



