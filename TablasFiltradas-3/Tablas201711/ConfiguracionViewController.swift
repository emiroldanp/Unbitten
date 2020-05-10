//
//  ConfiguracionViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 20/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit
import Vision

class ConfiguracionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var camaraBoton: UIButton!
    @IBOutlet weak var fotoVista: UIImageView!
    
    
    private let miPicker = UIImagePickerController()    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            camaraBoton.isHidden = true
        }
        miPicker.delegate = self
        
    }
    
    @IBAction func guardarImagen(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(fotoVista.image!, nil, nil, nil)
    }
    /*
    @IBAction func guardarFoto(_ sender: Any) {
    UIImageWriteToSavedPhotosAlbum(fotoVista.image!, nil, nil, nil)
    }*/
    
    @IBAction func cambiarFoto(_ sender: Any) {
        miPicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(miPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        fotoVista.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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
