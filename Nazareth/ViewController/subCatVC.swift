//
//  subCatVC.swift
//  Nazareth
//
//  Created by Farido on 8/25/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class subCatVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewProdects: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionViewProdects.delegate = self
        collectionViewProdects.dataSource = self
        collectionView.dropShadow()
        //collectionViewProdects.dropShadow()
    }//
    
    
    
}

extension UICollectionView{
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
    }
    
    
    
}

extension subCatVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 0 {
            return 1
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 10
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! prodectsCell
        
        return cell
            
        }else {
            let cell = collectionViewProdects.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! allProdectCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0{
            let size = collectionView.frame.size
            return CGSize(width: 200, height: size.height)
        }else {
            let screenWidth = collectionView.frame.width
            
            var width = (screenWidth-10)/2
            
            width = width < 130 ? 160 : width
            
            return CGSize.init(width: width, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: nil)
    }
    
}
