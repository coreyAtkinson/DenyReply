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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.setofcardsets[AppData.index].cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(AppData.setofcardsets[AppData.index].cards[indexPath.row].question)"
        cell.detailTextLabel?.text = "\(AppData.setofcardsets[AppData.index].cards[indexPath.row].answer)"
        return cell
    }
    
    
    
    @IBAction func gotoAddCardAction(_ sender: Any) {
        
        performSegue(withIdentifier: "toFive", sender: self)
    }
    
    
    
  
}
