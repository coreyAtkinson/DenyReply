//
//  FourViewController.swift
//  DenyReply
//
//  Created by COREY ATKINSON on 11/15/23.
//

import UIKit

class FourViewController: UIViewController {

    @IBOutlet weak var setColorOutlet: UITextField!
    @IBOutlet weak var setNameOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setAction(_ sender: UIButton) {
        let name = setNameOutlet.text ?? ""
        let color = setColorOutlet.text ?? ""
        
        
        addnewSet(name: name, color: color)
        
        
        
        
        
    }
    
    
    
    
    func addnewSet(name: String, color: String){
        
       // let thisname = name!
       // let thiscolor = color!
        
        let exampleCard = card(question2: "This is an example card", answer2: "this is an example answer")
        
        let newset = cardSetClass(setName: name, setColor: color, cards: [exampleCard])
        
        AppData.setofcardsets.append(newset)
    }
    
   

}
