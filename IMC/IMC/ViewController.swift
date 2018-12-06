//
//  ViewController.swift
//  IMC
//
//  Created by Fourtime on 04/12/18.
//  Copyright © 2018 Fourtime. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viewResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: AnyObject) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!){
            imc = weight / (height*height)
            showResults()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Quando apertar o botão todas as views dentro da tela vão perder o foco fazendo o teclado fechar
        view.endEditing(true)
    }

    func showResults(){
        var result: String = ""
        var image: String = ""
        
        switch imc {
        case 0..<16:
            result = "Magreza"
            image = "abaixo"
        case 16..<18.5:
            result = "Abaixo do Peso"
            image = "abaixo"
        case 18.5..<25:
            result = "Peso Ideal"
            image = "ideal"
        case 25..<230:
            result = "Sobrepeso"
            image = "sobre"
        default:
            result = "Obesidade"
            image = "obesidade"
        }
        
        lbResult.text = "\(Int(imc)):\(result)"
        ivResult.image = UIImage(named: image)
        viewResult.isHidden = false
        //Quando apertar o botão todas as views dentro da tela vão perder o foco fazendo o teclado fechar
        view.endEditing(true)
    }
}

