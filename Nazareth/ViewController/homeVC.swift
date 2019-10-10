//
//  ViewController.swift
//  Nazareth
//
//  Created by Farido on 8/25/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit

class homeVC: UIViewController {
    
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var cat = [homeData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTF.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        imageText()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        //revealViewController()?.rightRevealToggle(animated: false)
        
        handleRefreshgetCat()
        
    }
    
    @objc private func handleRefreshgetCat() {
        API_Home.categories{(error: Error?, cat: [homeData]?) in
            if let cat = cat {
                self.cat = cat
                print("xxx\(self.cat)")
                self.tableView.reloadData()
            }
        }
    }
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    @IBAction func sideMenuBTN(_ sender: Any) {
        if let vc = self.revealViewController() {
            vc.revealToggle(animated: true)
            //self.view.addGestureRecognizer(vc.panGestureRecognizer())
            self.view.addGestureRecognizer(vc.tapGestureRecognizer())
            vc.rearViewRevealWidth = screenWidth - 60
            
            //        revealViewController().rightViewRevealWidth = kWIDTH
            //        revealViewController().frontViewPosition =
            
            
        }
    }
    
    func imageText() {
        
        if let myImage = UIImage(named: "ic_search"){
            
            searchTF.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? subCatVC{
            destaiantion.singleItem = sender as? homeData
        }else if let destaination = segue.destination as? searchResultVC{
            destaination.searchWord = searchTF.text ?? ""
        }
    }
}

extension homeVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? homeCell{
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            let cats = cat[indexPath.row]
            cell.configuerCell(prodect: cats)
            return cell
        }else {
            return homeCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: cat[indexPath.row])
    }
    
    
    //    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    //        return 10.0
    //    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 64
    //    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 10))
        view.backgroundColor = .clear
        
        return view
    }
}

extension homeVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {


        textField.resignFirstResponder()  //if desired
        performSegue(withIdentifier: "suge1", sender: nil)
        return true
    }
}
