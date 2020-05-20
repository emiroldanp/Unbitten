//
//  MLViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 20/05/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit
import CoreML
import Vision

@available(iOS 11.0, *)
class MLViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var identifiacionImagen: UILabel!
    
    @IBOutlet weak var camaraBoton: UIButton!
    
    @IBOutlet weak var fotoVista: UIImageView!
    
    private let miPicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            camaraBoton.isHidden = true
        }
        miPicker.delegate = self
    }
    
    
    @IBAction func guardarImagen(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(fotoVista.image!, nil, nil, nil)
    }
    
    @available(iOS 12.0, *)
    @IBAction func ejecutarML(_ sender: Any) {
        //instanciar el modelo de la red neuronal
        let modelFile = Alimentos()
        let model = try! VNCoreMLModel(for: modelFile.model)
        //Convertir la imagen obtenida a CIImage
        let imagenCI = CIImage(image: fotoVista.image!)
        //Crear un controlador para el manejo de la imagen, este es un requerimiento para ejecutar la solicitud del modelo
        let handler = VNImageRequestHandler(ciImage: imagenCI!)
        //Crear una solicitud al modelo para el análisis de la imagen
        let request = VNCoreMLRequest(model: model, completionHandler: resultadosModelo)
        try! handler.perform([request])
        
    }
    
    func resultadosModelo(request: VNRequest, error: Error?) {
        guard let results = request.results as? [VNClassificationObservation] else { fatalError("No hubo respuesta del modelo ML")}
        var bestPrediction = ""
        var bestConfidence: VNConfidence = 0
        //recorrer todas las respuestas en búsqueda del mejor resultado
        for classification in results{
            if (classification.confidence > bestConfidence){
                bestConfidence = classification.confidence
                bestPrediction = classification.identifier
            }
        }
        let resultado = bestPrediction+" "+String(bestConfidence)
        print(resultado)
        identifiacionImagen.text = resultado
    }
    
    @IBAction func camara(_ sender: Any) {
        miPicker.sourceType = UIImagePickerController.SourceType.camera
        present(miPicker, animated: true, completion: nil)
    }
   
    @IBAction func album(_ sender: Any) {
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
    
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }

    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
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
