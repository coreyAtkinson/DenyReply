//
//  viewQuiz.swift
//  DenyReply
//
//  Created by CATHERINE HUSEBY on 11/21/23.
//

import UIKit
// hi
class viewQuiz: UIViewController {
var score = 0
    @IBOutlet weak var a2Outlet: UIButton!
    @IBOutlet weak var a3Outlet: UIButton!
    @IBOutlet weak var scoreOutlet: UILabel!
    @IBOutlet weak var correctOutlet: UILabel!
    @IBOutlet weak var questionOutlet: UILabel!
    @IBOutlet weak var a1Outlet: UIButton!
    var rightAnswer = 0
    var questions = AppData.setofcardsets[AppData.index].cards
    var i = 0
   var randomAnswers = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        questionOutlet.text = questions[i].question
        var rands = generateRando(from: 0, to: questions.count - 1, quant: 2)
        randomAnswers = [questions[i].answer, questions[rands[0]].answer,questions[rands[1]].answer]
      
        randomAnswers.shuffle()
        a1Outlet.titleLabel?.text = "\(randomAnswers[0])"
        a2Outlet.titleLabel?.text = "\(randomAnswers[1])"
        a3Outlet.titleLabel?.text = "\(randomAnswers[2])"
        // Do any additional setup after loading the view.
    }
    
    func generateRando(from: Int, to: Int, quant: Int?) -> [Int]
    {
        var myRandomNumbers = [Int]()
        var numberOfNumbers = quant
        
        var lower = UInt32(from)
        var higher = UInt32(to)
        
        if numberOfNumbers == nil || numberOfNumbers!  > (to-from) + 1
        {
            numberOfNumbers = (to-from) + 1
        }
        while(myRandomNumbers.count != numberOfNumbers)
        {
            let myNumber = arc4random_uniform(higher - lower) + lower
            
            if !myRandomNumbers.contains(Int(myNumber))
            {
                myRandomNumbers.append(Int(myNumber))
            }
        }
        return myRandomNumbers
    }
    
    
    
    
    @IBAction func nextAction(_ sender: UIButton) {
        if(i < questions.count - 1)
        {
            i = i + 1
            questionOutlet.text = questions[i].question
            var rands = generateRando(from: 0, to: questions.count - 1, quant: 2)
            randomAnswers = [questions[i].answer, questions[rands[0]].answer,questions[rands[1]].answer]
           randomAnswers.shuffle()
            
            print(randomAnswers[0])
            print(randomAnswers[1])
            print(randomAnswers[2])
            if(randomAnswers[0] == questions[i].answer)
            {
                rightAnswer = 1
            }
            if(randomAnswers[1] == questions[i].answer)
            {
                rightAnswer = 2
            }
            if(randomAnswers[2] == questions[i].answer)
            {
                rightAnswer = 3
            }
           a1Outlet.titleLabel?.text = "\(randomAnswers[0])"
           a2Outlet.titleLabel?.text = "\(randomAnswers[1])"
           a3Outlet.titleLabel?.text = "\(randomAnswers[2])"
        }
        else{
            questionOutlet.text = "You completed the quiz! YAY"
            }
        
    }
    
    @IBAction func a1Action(_ sender: UIButton) {
        if(rightAnswer == 1)
        {
            correctOutlet.text = "correct!"
            score = score + 1
            scoreOutlet.text = "score: \(score)"
        }
        else
        {
            correctOutlet.text = "inncorect :("
        }
        
    }
    
    @IBAction func a2Action(_ sender: UIButton) {
        if(rightAnswer == 2)
        {
            correctOutlet.text = "correct!"
            score = score + 1
            scoreOutlet.text = "score: \(score)"
        }
        else
        {
            correctOutlet.text = "inncorect :("
        }
        
    }
    @IBAction func a3Action(_ sender: UIButton) {
        if(rightAnswer == 3)
        {
            correctOutlet.text = "correct!"
            score = score + 1
            scoreOutlet.text = "score: \(score)"
        }
        else
        {
            correctOutlet.text = "inncorect :("
        }
        
    }
    
}
