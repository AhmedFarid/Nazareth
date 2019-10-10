//
//  searchResultVC.swift
//  Nazareth
//
//  Created by Farido on 8/27/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class searchResultVC: UIViewController {
    
    var searchWord = ""
    var prodects = [prodectData]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? prodectDetialsVC{
            destaiantion.singleItem = sender as? prodectData
            
        }
    }
    
    func getData() {
        API_Home.searchAPI(search: searchWord){(error: Error?, prodects: [prodectData]?) in
            if let prodects = prodects {
                self.prodects = prodects
                print("xxx\(self.prodects)")
                self.tableView.reloadData()
            }
        }
    }
    
}

extension searchResultVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prodects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? searchResultCell{
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            let pro = prodects[indexPath.row]
            cell.configuerCell(prodect: pro)
            return cell
        }else {
            return searchResultCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: prodects[indexPath.row])
    }
}

