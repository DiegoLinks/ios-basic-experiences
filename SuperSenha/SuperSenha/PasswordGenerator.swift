//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Fourtime on 11/12/18.
//  Copyright © 2018 Diego. All rights reserved.
//

import Foundation

class PasswordGenerator{

    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useEspecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvxwyz"
    private let especialCharacers = "˜!@#$%ˆ&*()[]{}|=-`.,><"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool,
         useEspecialCharacters: Bool ) {
        
         var numchars = min(numberOfCharacters, 16)
         numchars = max(numchars, 1)
   
         self.useEspecialCharacters = useEspecialCharacters
         self.useLetters = useLetters
         self.useNumbers = useNumbers
         self.useCapitalLetters = useCapitalLetters
         self.numberOfCharacters = numchars
        
    }
    
    func generate(total: Int) -> [String]{
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useEspecialCharacters {
            universe += especialCharacers
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe.characters)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords

    }

}
