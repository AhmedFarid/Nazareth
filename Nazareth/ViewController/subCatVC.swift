//
//  subCatVC.swift
//  Nazareth
//
//  Created by Farido on 8/25/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class subCatVC: UIViewController {
    
    @IBOutlet weak var catDES: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewProdects: UICollectionView!
    
    
    var refreshControl = UIRefreshControl()
    var singleItem: homeData?
    var subCat = [subCatData]()
    var prodects = [prodectData]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(singleItem?.name ?? "")"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionViewProdects.delegate = self
        collectionViewProdects.dataSource = self
        collectionView.dropShadow()
        //collectionViewProdects.dropShadow()
        handleRefreshgetSubCat()
        catDES.text = singleItem?.descript
        
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        collectionViewProdects.refreshControl = refreshControl
    }//
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        handleRefreshgetProdects(subID: index)
        print(index)
    }
    
    
    @objc func refresh(sender:AnyObject) {
        handleRefreshgetProdects(subID: index)
        refreshControl.endRefreshing()
    }
    
    @objc private func handleRefreshgetSubCat() {
        API_Home.SubCategories(category_id: singleItem?.id ?? 0){(error: Error?, subCat: [subCatData]?) in
            if let subCat = subCat {
                self.subCat = subCat
                print("xxx\(self.subCat)")
                self.collectionView.reloadData()
                let indexPath = IndexPath(row: 0, section: 0)
                self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
                self.handleRefreshgetProdects(subID:subCat.first?.id ?? 0)
            }
        }
    }
    
    @objc private func handleRefreshgetProdects(subID: Int) {
        API_Home.prodects(subcategory_id: subID){(error: Error?, prodects: [prodectData]?) in
            if let prodects = prodects {
                self.prodects = prodects
                print("xxx\(self.prodects)")
                self.collectionViewProdects.reloadData()
            }
        }
    }
    
    @IBAction func fileterBTN(_ sender: Any) {
        performSegue(withIdentifier: "suge2", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? prodectDetialsVC{
            destaiantion.singleItem = sender as? prodectData
        }else if let destaintion = segue.destination as? filterVC{
            destaintion.catIdFromSuge = singleItem?.id ?? 0
            
        }
    }
    
    
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
            return subCat.count
        }else{
            return prodects.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? prodectsCell{
                let Subcats = subCat[indexPath.row]
                cell.configuerCell(prodect: Subcats)
                
                return cell
            }else {
                return prodectsCell()
            }
            
        }else {
            if let cell = collectionViewProdects.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? allProdectCell {
                let prodect = prodects[indexPath.row]
                cell.configuerCell(prodect: prodect)
                return cell
            }else {
                return allProdectCell()
            }
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
        if collectionView.tag == 0 {
            handleRefreshgetProdects(subID: subCat[indexPath.row].id)
            index = subCat[indexPath.row].id
        }else{
            performSegue(withIdentifier: "suge", sender: prodects[indexPath.row])
        }
    }
    
}
