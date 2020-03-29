//
//  ArticlesVC.swift
//  Nazareth
//
//  Created by Farido on 8/28/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class ArticlesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var articals = [event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        handleRefreshgetEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handleRefreshgetEvents()
    }
    
    @objc private func handleRefreshgetEvents() {
        Api_menu.evants(url: URLs.articles){(error: Error?, articals: [event]?) in
            if let articals = articals {
                self.articals = articals
                print("xxx\(self.articals)")
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? articlesDtitlesVC{
            destaiantion.singleItem = sender as? event
        }
    }
    

    @IBAction func closeBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}


extension ArticlesVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? eventsCell{
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            let event = articals[indexPath.row]
            cell.configuerCell(prodect: event)
            return cell
        }else {
            return eventsCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: articals[indexPath.row])
    }
}
