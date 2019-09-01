//
//  prodectDetialsVC.swift
//  Nazareth
//
//  Created by Farido on 8/27/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class prodectDetialsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var similarCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        similarCollectionView.delegate = self
        similarCollectionView.dataSource = self
        //collectionView.dropShadow()

    }
    

    

}

extension prodectDetialsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 0{
        return 1
        }else {
                return 1
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return 10
        }else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! prodectImagesCell
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! allProdectCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0{
            let size = collectionView.frame.size
            return CGSize(width: size.height, height: size.height)
        }else {
            let size = collectionView.frame.size
            return CGSize(width: size.height, height: size.height)
        }
    }
    
}
