//
//  DetalleViewController.swift
//
//Created by Unbitten 2020
//  Copyright © 2020 Unbitten All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {

    var marca:String="VW"
    @IBOutlet weak var laMarca: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        laMarca.text = marca
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
