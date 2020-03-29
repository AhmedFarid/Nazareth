//
//  prodectDetialsVC.swift
//  Nazareth
//
//  Created by Farido on 8/27/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos

class prodectDetialsVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var totalReat: CosmosView!
    @IBOutlet weak var avgPebleLbl: UILabel!
    @IBOutlet weak var simallerCat: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var similarCollectionView: UICollectionView!
    @IBOutlet weak var titelTF: UILabel!
    @IBOutlet weak var dec: UILabel!
    @IBOutlet weak var addressTF: UILabel!
    @IBOutlet weak var addressTitle: UILabel!
    
    var refreshControl = UIRefreshControl()
    
    var singleItem: prodectData?
    var images = [prodectImages]()
    var simares = [prodectData]()
    
    var index = Int()
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        scrollView.refreshControl = refreshControl
        
        collectionView.delegate = self
        collectionView.dataSource = self
        similarCollectionView.delegate = self
        similarCollectionView.dataSource = self
        setUpView()
        handleRefreshgetProdectsImage()
        handleRefreshgetSimelerProdects(prodectID: singleItem?.id ?? 0)
        //collectionView.dropShadow()

    }
    
    @objc func refresh(sender:AnyObject) {
        setUpView()
        handleRefreshgetProdectsImage()
        handleRefreshgetSimelerProdects(prodectID: singleItem?.id ?? 0)
        refreshControl.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleRefreshgetProdectsImage()
        handleRefreshgetSimelerProdects(prodectID: singleItem?.id ?? 0)
    }
    
    @objc private func handleRefreshgetSimelerProdects(prodectID: Int) {
        API_Home.similarProducts(product_id: prodectID){(error: Error?, simares: [prodectData]?) in
            if let simares = simares {
                self.simares = simares
                print("xxx\(self.simares)")
                self.similarCollectionView.reloadData()
            }
        }
    }
    
    
    @objc private func handleRefreshgetProdectsImage() {
        API_Home.prodectIamges(type_id: singleItem?.id ?? 0){(error: Error?, images: [prodectImages]?) in
            if let images = images {
                self.images = images
                print("xxx\(self.images)")
                self.collectionView.reloadData()
            }
        }
    }
    
    
    func setUpView(){
        totalReat.rating = singleItem?.average_rating ?? 0.0
        let personReview = NSLocalizedString("person review", comment: "profuct list lang")
        avgPebleLbl.text = "(\(singleItem?.total_rate ?? 0) \(personReview))"
        titelTF.text = singleItem?.name
        dec.text = singleItem?.descript
        addressTF.text = singleItem?.address
        let whereThe = NSLocalizedString("Where The", comment: "profuct list lang")
        let are = NSLocalizedString("Are", comment: "profuct list lang")
        addressTitle.text = "\(whereThe) \(singleItem?.name ?? "") \(are)"
        let similar = NSLocalizedString("Similar", comment: "profuct list lang")
        simallerCat.text = "\(similar) \(singleItem?.name ?? "")"
        
        img.image = UIImage(named: "3")
        let s = singleItem?.image
        let encodedLink = s?.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        img.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            img.kf.setImage(with: url)
        }
    }
    
    @IBAction func mapBTN(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: nil)
    }
    
    @IBAction func reciewBNT(_ sender: Any) {
        performSegue(withIdentifier: "suge2", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? mapVC{
            destaiantion.singleItem = singleItem
        }else if let destaiantion = segue.destination as? reviwesVC{
            destaiantion.singleItem = singleItem
        }else if let destaiantion = segue.destination as? imagesVC {
            //destenation.productID = self.id
            destaiantion.image = self.images
            destaiantion.index = self.index
        }
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
            return images.count
        }else {
            return simares.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? prodectImagesCell {
                let imageProdect = images[indexPath.row]
                cell.configuerCell(prodect: imageProdect)
            
                return cell
            }else {
               return prodectImagesCell()
            }
        }else {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? allProdectCell{
                let sim = simares[indexPath.row]
                cell.configuerCell(prodect: sim)
                return cell
            }else {
                return allProdectCell()
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            self.index = indexPath.item
            performSegue(withIdentifier: "sugeImges", sender: nil)
        }else{
            singleItem = simares[indexPath.row]
            setUpView()
            handleRefreshgetProdectsImage()
            handleRefreshgetSimelerProdects(prodectID: singleItem?.id ?? 0)
            scrollView.setContentOffset(.zero, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0{
            let size = collectionView.frame.size
            return CGSize(width: size.height, height: size.height)
        }else {
            let size = collectionView.frame.size
            return CGSize(width: size.width / 1.8, height: size.height)
        }
    }
    
}
