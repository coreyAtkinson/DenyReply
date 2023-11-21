//
//  ThreeViewController.swift
//  DenyReply
//
//  Created by COREY ATKINSON on 11/15/23.
//

import UIKit

class ThreeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
   // var set : cardSetClass!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        
       // print(AppData.setofcardsets)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableViewOutlet.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.setofcardsets[AppData.index].cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(AppData.setofcardsets[AppData.index].cards[indexPath.row].question)"
        cell.detailTextLabel?.text = "\(AppData.setofcardsets[AppData.index].cards[indexPath.row].answer)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            AppData.setofcardsets[AppData.index].removeCard(index: indexPath.row)
            
            
            tableViewOutlet.deleteRows(at: [indexPath], with: .fade)
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.setofcardsets) {
                AppData.defaults.set(encoded, forKey: "CardSetSet")
            }
            tableViewOutlet.reloadData()
         //   defaults.setValue(shoppingCart, forKey: "shoppingCart")
            
            
        }
        }

    
    

    @IBAction func shuffleAction(_ sender: Any) {
        AppData.setofcardsets[AppData.index].shuffleCards()
        tableViewOutlet.reloadData()
        
    }
    
    
    
    @IBAction func goToAction(_ sender: Any) {
        
        performSegue(withIdentifier: "toFive", sender: self)

    }
    
    
    
    @IBAction func goToQuizAction(_ sender: Any) {
    
        performSegue(withIdentifier: "toQuiz", sender: self)
    }
    
    
    
    
  
    
}
