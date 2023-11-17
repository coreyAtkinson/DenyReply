//
//  FiveViewController.swift
//  DenyReply
//
//  Created by COREY ATKINSON on 11/15/23.
//

import UIKit

class FiveViewController: UIViewController {
    @IBOutlet weak var questionOutlet: UITextField!
    
    @IBOutlet weak var answerOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addCardAction(_ sender: UIButton) {
        
        let question
        = questionOutlet.text ?? ""
        let answer = answerOutlet.text ?? ""
        
        let newCard = card(question2: question, answer2: answer)
        AppData.setofcardsets[AppData.index].addCard(myCard: newCard)
        
        
        questionOutlet.text = ""
        answerOutlet.text = ""
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.setofcardsets) {
            AppData.defaults.set(encoded, forKey: "CardSetSet")
        }
        
        
        
    }
    

}
