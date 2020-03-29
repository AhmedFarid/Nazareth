//
//  eventsVC.swift
//  Nazareth
//
//  Created by Farido on 10/2/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class eventsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var events = [event]()
    
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
        Api_menu.evants(url: URLs.events){(error: Error?, events: [event]?) in
            if let events = events {
                self.events = events
                print("xxx\(self.events)")
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? eventsDetialsVC{
            destaiantion.singleItem = sender as? event
        }
    }
    
    @IBAction func closeBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}


extension eventsVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? eventsCell{
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            let event = events[indexPath.row]
            cell.configuerCell(prodect: event)
            return cell
        }else {
            return eventsCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: events[indexPath.row])
    }
}

