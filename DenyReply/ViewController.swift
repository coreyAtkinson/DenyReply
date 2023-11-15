//
//  ViewController.swift
//  DenyReply
//
//  Created by COREY ATKINSON on 11/14/23.
//

import UIKit

class card: Codable
{
    var question : String
    var answer : String
    
    
    //<<<<<<< Updated upstream
    init(question2: String, answer2: String) {
        question = question2
        answer = answer2
        //=======
        
    }
    
}
    
    class cardSetClass: Codable {
        
        var setName = ""
        var setColor = ""
        var setImage = ""
        var cards: [card] = []
        init(setName: String, setColor: String, cards: [card]) {
            self.setName = setName
            self.setColor = setColor
            self.cards = cards
            
            //>>>>>>> Stashed changes
        }
        
        
        
        func addCard(myCard: card){
            cards.append(myCard)
        }
        //  }
        
        
    }
    
    
    class AppData: Codable
    {

        static var name = ""
        static var setofcardsets: [cardSetClass] = []
        
        
    }
    
    
    
    class ViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        
        
        //Yassss
        //wwwwwwwwww
        
    }
    
