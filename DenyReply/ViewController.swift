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
    
    
    init(question2: String, answer2: String) {
        question = question2
        answer = answer2
       
        
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
            
        }
        
        
        
        func addCard(myCard: card){
            cards.append(myCard)
        }
        
        func removeCard(index: Int){
            cards.remove(at: index)
        }
        
        func shuffleCards(){
            cards.shuffle()
        }
        
        
    }
    
    
    class AppData: Codable
    {
        
        static let defaults = UserDefaults.standard
        

        static var name = ""
        static var setofcardsets: [cardSetClass] = []
        static var index = 0
        
        
    }
    
    
    
    class ViewController: UIViewController {
        
        
        @IBOutlet weak var youhaveOutlet: UILabel!
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            let card1 = card(question2: "what is 2 + 2", answer2: "FISH")
            
            let set1 = cardSetClass(setName: "numbers", setColor: "pink", cards: [card1])
            
            AppData.setofcardsets.append(set1)
    
            
            
            if let items = AppData.defaults.data(forKey: "CardSetSet") {
                            let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([cardSetClass].self, from: items) {
                                AppData.setofcardsets = decoded
                            }
                
                    }
        }
        
        
        override func viewDidAppear(_ animated: Bool) {
            youhaveOutlet.text = "you have \(AppData.setofcardsets.count) set/s"
        }
        
        @IBAction func goToSetsAction(_ sender: Any) {
            
            performSegue(withIdentifier: "toTwo", sender: self)
        }
        
        
        func addnewSet(name: String, color: String){
            
            let exampleCard = card(question2: "This is an example card", answer2: "this is an example answer")
            
            let newset = cardSetClass(setName: name, setColor: color, cards: [exampleCard])
            
            AppData.setofcardsets.append(newset)
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.setofcardsets) {
                AppData.defaults.set(encoded, forKey: "CardSetSet")
            }
        }
    
    }
    
