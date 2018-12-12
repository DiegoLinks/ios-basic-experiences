//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Fourtime on 11/12/18.
//  Copyright © 2018 Diego. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 10
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useEspecialCharacters: Bool!

    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Troca o título da tela (View Controller)
        title = "Total de senhas: \(numberOfPasswords)"
        
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useEspecialCharacters: useEspecialCharacters)
        
        generatePasswords()
    }
    
    func generatePasswords(){
        //Leva o scroll do textview  uma posição expecífica
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        
        tvPasswords.text = ""
        
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: AnyObject) {
        generatePasswords()
    }
}
