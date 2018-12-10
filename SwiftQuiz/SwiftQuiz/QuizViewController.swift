//
//  QuizViewController.swift
//  SwiftQuiz


import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    @IBOutlet weak var viProgress: UIView!
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Sempre que a telal vai aparecer passa por esse método
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Reinicia a largura da viTimer = largura da tela
        viProgress.frame.size.width = view.frame.size.width
        
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            
            //Após os 60.0 da withDuration a largura da viTimer será igual a 0
            self.viProgress.frame.size.width = 0
            }) { (success) in
                self.showResults()
        }
        
        getNewQuiz()
        
    }

    func getNewQuiz(){
        quizManager.refreshQuiz()
        //Pega a pergunat e exibe na label
        lbQuestion.text = quizManager.question
        
        //Busca as respostas de 0 a 3(size da lista)
        for i in 0..<quizManager.options.count{
            
            //pega as respostas
            let option = quizManager.options[i]
            
            //insere as respostas no array de bottões
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        
        }
    }
    
    func showResults(){
        performSegue(withIdentifier: "resultsSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        
        //confere a resposta escolhida
        let index = btAnswers.index(of: sender)!
        quizManager.validateAnswre(index: index)
        getNewQuiz()
    }
   
}
