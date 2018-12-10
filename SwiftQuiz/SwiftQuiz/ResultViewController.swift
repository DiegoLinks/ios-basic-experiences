//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Fourtime on 10/12/18.
//  Copyright © 2018 Fourtime. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbAnswers: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        lbAnswers.text = "Perguntas Respondidas \(totalAnswers)"
        lbCorrect.text = "Respostas Certas \(totalCorrectAnswers)"
        lbWrong.text = "Respostas Erradas \(totalAnswers - totalCorrectAnswers)"

        if totalAnswers > 0 {
            let percentCorrect = totalCorrectAnswers*100/totalAnswers
            lbScore.text = "\(percentCorrect)%"
        } else {
            lbScore.text = "0%"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    

    @IBAction func close(_ sender: AnyObject) {
        totalCorrectAnswers=0
        totalAnswers=0
        dismiss(animated: true, completion: nil)
    }
}
