//
//  TwoViewController.swift
//  DenyReply
//
//  Created by COREY ATKINSON on 11/15/23.
//

import UIKit

class TwoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        collectionViewOutlet.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppData.setofcardsets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yay", for: indexPath)
        cell.backgroundColor = UIColor(named: AppData.setofcardsets[indexPath.row].setColor)
        
        
        
        
        //cell.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
        
    
        return cell
    }
    
    
    @IBAction func goToAddSetAction(_ sender: Any) {
        
        performSegue(withIdentifier: "toFour", sender: self)
    }
    
    
    
}
