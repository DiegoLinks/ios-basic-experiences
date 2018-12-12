//
//  ViewController.swift
//  SuperSenha
//
//  Created by Fourtime on 11/12/18.
//  Copyright © 2018 Diego. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPassword: UITextField!
    @IBOutlet weak var fNumberOfCharacteres: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCaptalLetters: UISwitch!
    @IBOutlet weak var swEspecialCharacters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Passar dados a outra ViewControler (similar a intent Android)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //View Controller que reeberá os dados
        let passwordsViewController = segue.destination as! PasswordsViewController
        
        //Valida o campo
        if let numberOfPasswords = Int(tfTotalPassword.text!){
            //Atribui valor a variavel criada na tela que receberá os dados
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacteres = Int(fNumberOfCharacteres.text!){
            passwordsViewController.numberOfCharacters = numberOfCharacteres
        }
        
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCaptalLetters.isOn
        passwordsViewController.useEspecialCharacters = swEspecialCharacters.isOn
        
        //Esconde o teclado
        view.endEditing(true)
    }


}

