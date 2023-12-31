//
//  FourViewController.swift
//  DenyReply
//
//  Created by COREY ATKINSON on 11/15/23.
//

import UIKit

class FourViewController: UIViewController, UITextFieldDelegate {

    
    let potColors = ["pink", "red", "orange", "yellow", "green", "blue", "purple", "brown"]
    @IBOutlet weak var setColorOutlet: UITextField!
    @IBOutlet weak var setNameOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameOutlet.delegate = self
        setColorOutlet.delegate = self
    }
    
    @IBAction func setAction(_ sender: UIButton) {
        var hasColor: Bool = false
        
        let name = setNameOutlet.text ?? ""
        var color = setColorOutlet.text?.lowercased() ?? ""
        
        for x in potColors {
            if color == x {
                hasColor = true
            }
        }
        if hasColor == false {
            color =  "red"
        }
        addnewSet(name: name, color: color)
        
        setNameOutlet.text = ""
        setColorOutlet.text = ""
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setNameOutlet.resignFirstResponder()
        setColorOutlet.resignFirstResponder()
        
        return true
    }

}
