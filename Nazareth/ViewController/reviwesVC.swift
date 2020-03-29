//
//  reviwesVC.swift
//  Nazareth
//
//  Created by Farido on 8/27/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos

class reviwesVC: UIViewController {
    
    var singleItem: prodectData?
    var images = [prodectImages]()
    var comments = [reviewsData]()
    
    @IBOutlet weak var totalReat: CosmosView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var reviewBTN: UIButton!
    @IBOutlet weak var reviewTable: UITableView!
    @IBOutlet weak var prodectCollection: UICollectionView!
    @IBOutlet weak var nameTF: UILabel!
    @IBOutlet weak var avgPebleLbl: UILabel!
    @IBOutlet weak var SCROLL: UIScrollView!
    
     var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
               SCROLL.refreshControl = refreshControl
        reviewTable.delegate = self
        reviewTable.dataSource = self
        prodectCollection.delegate = self
        prodectCollection.dataSource = self
        handleRefreshgetProdectsImage()
        handleRefreshgetComments()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleRefreshgetProdectsImage()
        handleRefreshgetComments()
        setUpView()
    }
    
    @objc func refresh(sender:AnyObject) {
           handleRefreshgetProdectsImage()
           handleRefreshgetComments()
           setUpView()
           refreshControl.endRefreshing()
       }
    
    @objc private func handleRefreshgetProdectsImage() {
        API_Home.prodectIamges(type_id: singleItem?.id ?? 0){(error: Error?, images: [prodectImages]?) in
            if let images = images {
                self.images = images
                print("xxx\(self.images)")
                self.prodectCollection.reloadData()
            }
        }
    }
    
    
    @objc private func handleRefreshgetComments() {
        Api_menu.reviews(product_id: "\(singleItem?.id ?? 0)"){(error: Error?, comments: [reviewsData]?) in
            if let comments = comments {
                self.comments = comments
                print("xxx\(self.images)")
                self.reviewTable.reloadData()
            }
        }
    }
    
    func setUpView(){
        totalReat.rating = singleItem?.average_rating ?? 0.0
        let personReview = NSLocalizedString("person review", comment: "hhhh")
        avgPebleLbl.text = "(\(singleItem?.total_rate ?? 0) \(personReview))"
        nameTF.text = singleItem?.name
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? setReviewVC{
            destaiantion.singleItem = singleItem
        }
    }
}


extension reviwesVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? reviewCell{
            let coments = comments[indexPath.row]
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.configuerCell(prodect: coments)
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
        
        return images.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? prodectImagesCell {
            let imageProdect = images[indexPath.row]
            cell.configuerCell(prodect: imageProdect)
            
            return cell
        }else {
            return prodectImagesCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.height, height: size.height)
    }
    
}
