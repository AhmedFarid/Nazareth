//
//  reviwesVC.swift
//  Nazareth
//
//  Created by Farido on 8/27/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class reviwesVC: UIViewController {
    
    @IBOutlet weak var reviewBTN: UIButton!
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var prodectCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTable.delegate = self
        reviewTable.dataSource = self
        prodectCollection.delegate = self
        prodectCollection.dataSource = self
    }
    
    
    
    
}


extension reviwesVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? reviewCell{
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }else {
            return reviewCell()
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "suge", sender: nil)
//    }
}




extension reviwesVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = prodectCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! prodectImagesCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.height, height: size.height)
    }
    
}



