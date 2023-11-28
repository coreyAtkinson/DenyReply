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
    
    @IBOutlet weak var button1Outlet: UIButton!
    @IBOutlet weak var button2Outlet: UIButton!
    
    @IBOutlet weak var button3Outlet: UIButton!
    
    var rightAnswer = 0
    var rightAnswer2 = 0
    var rightAnswer3 = 0
    var clicked = 0
    var questions = AppData.setofcardsets[AppData.index].cards
    var i = 0
   var randomAnswers = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        questionOutlet.text = questions[i].question
        var rands = generateRando(from: 0, to: questions.count - 1, quant: 2, exclude: i)
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
            rightAnswer2 = 1
        }
        if(randomAnswers[2] == questions[i].answer)
        {
            rightAnswer3 = 1
        }
   //    a1Outlet.titleLabel?.text = "\(randomAnswers[0])"
   //    a2Outlet.titleLabel?.text = "\(randomAnswers[1])"
  //     a3Outlet.titleLabel?.text = "\(randomAnswers[2])"
        a1Outlet.setTitle("\(randomAnswers[0])", for: .normal)
        a2Outlet.setTitle("\(randomAnswers[1])", for: .normal)
        a3Outlet.setTitle("\(randomAnswers[2])", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    func generateRando(from: Int, to: Int, quant: Int?, exclude: Int) -> [Int]
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
            
            if !myRandomNumbers.contains(Int(myNumber)) || Int(myNumber) != exclude
            {
                myRandomNumbers.append(Int(myNumber))
            }
        }
        return myRandomNumbers
    }
    
    
    
    
    @IBAction func nextAction(_ sender: UIButton) {
        correctOutlet.text = ""
        rightAnswer = 0
        rightAnswer2 = 0
        rightAnswer3 = 0
        clicked = 0
        button1Outlet.isEnabled = true
    button2Outlet.isEnabled = true
       button3Outlet.isEnabled = true
        if(i < questions.count - 1)
        {
            i = i + 1
            questionOutlet.text = questions[i].question
            var rands = generateRando(from: 0, to: questions.count - 1, quant: 2, exclude: i)
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
                rightAnswer2 = 1
            }
            if(randomAnswers[2] == questions[i].answer)
            {
                rightAnswer3 = 1
            }
            a1Outlet.setTitle("\(randomAnswers[0])", for: .normal)
            a2Outlet.setTitle("\(randomAnswers[1])", for: .normal)
            a3Outlet.setTitle("\(randomAnswers[2])", for: .normal)
   //       a1Outlet.titleLabel?.text = "\(randomAnswers[0])"
     //     a2Outlet.titleLabel?.text = "\(randomAnswers[1])"
       //    a3Outlet.titleLabel?.text = "\(randomAnswers[2])"
        }
        else{
            questionOutlet.text = "You completed the quiz! YAY"
            button2Outlet.isEnabled = false
            button1Outlet.isEnabled = false
            button3Outlet.isEnabled = false
            }
        
    }
    
    @IBAction func a1Action(_ sender: UIButton) {
      //  a1Outlet.titleLabel?.text = a1Outlet.titleLabel?.text
        if(rightAnswer == 1)
        {
            correctOutlet.text = "correct!"
            score = score + 1
            scoreOutlet.text = "score: \(score)"
           
            if clicked == 0
            {
                scoreOutlet.text = "score: \(score)"
            }
            clicked = 1
        }
        else
        {
            correctOutlet.text = "inncorect :("
        }
       button2Outlet.isEnabled = false
       button1Outlet.isEnabled = false
       button3Outlet.isEnabled = false
    }
    
    @IBAction func a2Action(_ sender: UIButton) {
   //     a2Outlet.titleLabel?.text = a2Outlet.titleLabel?.text
        if(rightAnswer2 == 1)
        {
            correctOutlet.text = "correct!"
            score = score + 1
            scoreOutlet.text = "score: \(score)"
          
            if clicked == 0
            {
                scoreOutlet.text = "score: \(score)"
            }
            clicked = 1
        }
        else
        {
            correctOutlet.text = "inncorect :("
        }
       button2Outlet.isEnabled = false
       button1Outlet.isEnabled = false
       button3Outlet.isEnabled = false
    }
    @IBAction func a3Action(_ sender: UIButton) {
   //     a3Outlet.titleLabel?.text = a3Outlet.titleLabel?.text
        if(rightAnswer3 == 1)
        {
            correctOutlet.text = "correct!"
            score = score + 1
            
            if clicked == 0
            {
                scoreOutlet.text = "score: \(score)"
            }
            clicked = 1
        }
        else
        {
            correctOutlet.text = "inncorect :("
        }
       button2Outlet.isEnabled = false
       button1Outlet.isEnabled = false
       button3Outlet.isEnabled = false
    }
    
}
