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
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

}