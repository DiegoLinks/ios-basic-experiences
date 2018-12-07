//
//  ViewController.swift
//  Loteria
//
//  Created by Fourtime on 07/12/18.
//  Copyright © 2018 Fourtime. All rights reserved.
//

import UIKit

enum GameType: String{
    case megasena = "MegaSena"
    case quina = "Quina"
}

//Criando um operador personalizado apenas para demostração nesse app de testes
infix operator >-<
func >-< (total: Int, universe: Int) -> [Int]{
    var result: [Int] = []
    while result.count < total{
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber){
            result.append(randomNumber)
        }
    }
    return result.sorted()
}

class ViewController: UIViewController {

    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var scGameType: UISegmentedControl!
    
    
    @IBOutlet var balls: [UIButton]!

    //Esse seria o meu "Oncreate"
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
    }
    
    func showNumbers(for type: GameType){
        lbTitle.text = type.rawValue
        var game: [Int] = []
        switch type {
        case .megasena:
            game = 6>-<60
            balls.last!.isHidden = false
        case .quina:
            game = 5>-<80
            //Deixa a bola 6 invisivel
            balls.last!.isHidden = true
        }
        for (index,game) in game.enumerated(){
            balls[index].setTitle("\(game)", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateGame() {
        
        switch scGameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
        default:
            showNumbers(for: .quina)
        }
        
        //Outra forma de fazer
//        var megaSena: [Int] = []
//        
//        while megaSena.count < 6 {
//            
//            //arc4random_uniform gera número aleatórios de 0 ao intervalo entre parênteses -1
//            
//            let number = Int(arc4random_uniform(60)+1)
//            
//            //Caso megaSena não contenha o número gerado adiciona
//            
//            if !megaSena.contains(number) {
//                
//                megaSena.append(number)
//                
//            }
//            
//        }
//        
//        //Organiza os números em ordem crescente
//        
//        print(megaSena.sorted())
    }
}

