//
//  TwoViewController.swift
//  DenyReply
//
//  Created by COREY ATKINSON on 11/15/23.
//

import UIKit

class TwoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    var index = 0
var direction = 0
    
    @IBOutlet weak var setLabelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
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
    
        return cell
    }
    
    
    @IBAction func goToAddSetAction(_ sender: Any) {
        
        performSegue(withIdentifier: "toFour", sender: self)
    }
    func collectionView(_ collectionView: UICollectionView,
      didSelectItemAt indexPath: IndexPath) {
        AppData.index = indexPath.row
        
        setLabelOutlet.text = "Set: \(AppData.setofcardsets[AppData.index].setName)"
        direction = 1
        direction = 0
      }
    
    
    @IBAction func goToSetAction(_ sender: Any) {
        performSegue(withIdentifier: "toThree", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if direction == 1
        {
            let nvc = segue.destination as! ThreeViewController
        }
    }

    
}
