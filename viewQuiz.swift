//
//  viewQuiz.swift
//  DenyReply
//
//  Created by CATHERINE HUSEBY on 11/21/23.
//

import UIKit

class viewQuiz: UIViewController {
var score = 0
    @IBOutlet weak var a2Outlet: UIButton!
    @IBOutlet weak var a3Outlet: UIButton!
    @IBOutlet weak var scoreOutlet: UILabel!
    @IBOutlet weak var correctOutlet: UILabel!
    @IBOutlet weak var questionOutlet: UILabel!
    @IBOutlet weak var a1Outlet: UIButton!
    
    var questions = AppData.setofcardsets[AppData.index].cards
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func a1Action(_ sender: UIButton) {
        
        
        
        
    }
    
    @IBAction func a2Action(_ sender: UIButton) {
        
        
        
    }
    @IBAction func a3Action(_ sender: UIButton) {
        
        
        
    }
    
}
