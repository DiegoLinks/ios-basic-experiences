//
//  ViewController.swift
//  CicloDeVida
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    //Seria o OnCreate do Android
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("Tela 1: viewDidLoad")
        
        //Carrega apenas na primeira vez que a tela for aberta 
        label.text = "Digite seu nome"
        
    }

    //O código em viewWillAppear é executad toda vez que 
    //entrar nessa tela (chamando novamente o código)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Tela 1: viewWillAppear")
        
//        label.text = "Digite seu nome"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Tela 1: viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Tela 1: viewWillDisappear")
        
        label.text = textField.text
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("Tela 1: viewDidDisappear")
    }

}

