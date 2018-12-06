//
//  ViewController.swift
//  Conversores
//
//  Created by Fourtime on 05/12/18.
//  Copyright © 2018 Fourtime. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UITextField!
    @IBOutlet weak var lbResultUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
        case "Temperatura":
            lbUnit.text = "Peso"
            btUnit1.setTitle("Kilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dolar", for: .normal)
        case "Moeda":
            lbUnit.text = "Distância"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Kilômetro", for: .normal)
        default:
            lbUnit.text = "Temperatura"
            btUnit1.setTitle("Celsius", for: .normal)
            btUnit2.setTitle("Farenheint", for: .normal)
        }
        
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1{
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1
        }
        
        switch lbUnit.text! {
        case "Temperatura":
            calcTemperatute()
        case "Peso":
            calcWeight()
        case "Moeda":
            calcCurrency()
        default:
            calcDistance()
        }
        
        //Esconde o teclado
        view.endEditing(true)
        
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
        
    }
    
    func calcTemperatute (){
        //O return garante que retornará da função caso tfValue não tenha um valor válido
        guard let temperature = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            lbResult.text = String(temperature * 1.8 + 32.0)
            lbResultUnit.text = "Farenheint"
        } else {
            lbResult.text = String((temperature - 32.0) / 1.8)
            lbResultUnit.text = "Celsius"
        }
    
    }
    
    func calcCurrency(){
        guard let currency = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            lbResult.text = String(currency / 3.88)
            lbResultUnit.text = "Real"
        } else {
            lbResult.text = String(currency * 3.88)
            lbResultUnit.text = "Dólar"
        }
    }
    
    func calcWeight (){
        guard let weight = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            lbResult.text = String(weight / 2.2046)
            lbResultUnit.text = "Libra"
        } else {
            lbResult.text = String(weight * 2.2046)
                lbResultUnit.text = "Kilograma"
        }
    }
    
    func calcDistance (){
        guard let distance = Double(tfValue.text!) else {return}
        
        if btUnit1.alpha == 1.0 {
            lbResult.text = String(distance / 1000)
            lbResultUnit.text = "Kilômetro"
        } else {
            lbResult.text = String(distance * 1000)
            lbResultUnit.text = "Metro"
        }
    }
    
}

