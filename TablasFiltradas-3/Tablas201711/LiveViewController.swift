//
//  LiveViewController.swift
//  Tablas201711
//
//  Created by Emiliano Roldan on 21/04/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {
    
    var imagen:UIImage!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = imagen

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
