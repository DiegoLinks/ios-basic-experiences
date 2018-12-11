//
//  SecondViewController.swift
//  Navegacao
//
//  Created by Fourtime on 11/12/18.
//  Copyright © 2018 Fourtime. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Usasse o Dismiss para voltar a tela anterior via action
    @IBAction func back(_ sender: AnyObject) {
        performSegue(withIdentifier: "ViewController", sender: nil)
        //O completion poderia ser usado para executar alguma ação
        dismiss(animated: true, completion: nil)
    }

}
