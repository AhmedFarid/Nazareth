//
//  filterVC.swift
//  Nazareth
//
//  Created by Farido on 8/27/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import Cosmos

class filterVC: UIViewController {
    
    
    var catIdFromSuge = 0
    var subCat = [subCatData]()
    var catsId = 0
    
    @IBOutlet weak var catTF: UITextField!
    @IBOutlet weak var rate: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCatsPiker()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createCatsPiker()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? searchResultVC{
            destaiantion.catsID = catsId
            destaiantion.rate = rate.rating
        }
    }
    
    @objc private func handleRefreshgetSubCat() {
        API_Home.SubCategories(category_id: catIdFromSuge){(error: Error?, subCat: [subCatData]?) in
            if let subCat = subCat {
                self.subCat = subCat
                print("xxx\(self.subCat)")
                self.textEnabeld()
            }
        }
    }
    
    
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        let done = NSLocalizedString("Done", comment: "profuct list lang")
        let doneButton = UIBarButtonItem(title: done, style: .plain, target: self, action: #selector(filterVC.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        catTF.inputAccessoryView = toolBar
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func textEnabeld() {
        
        if subCat.isEmpty == true {
            catTF.isEnabled = false
        }else {
            catTF.isEnabled = true
        }
        
    }
    
    func createCatsPiker(){
        let sybCats = UIPickerView()
        sybCats.delegate = self
        sybCats.dataSource = self
        sybCats.tag = 0
        catTF.inputView = sybCats
        handleRefreshgetSubCat()
        sybCats.reloadAllComponents()
    }
    
    @IBAction func filterBTN(_ sender: Any) {
        guard catsId != 0,rate.rating != 0.0 else {
                   let messages = NSLocalizedString("filter", comment: "hhhh")
                   let title = NSLocalizedString("enter rate or chose categour", comment: "hhhh")
                   self.showAlert(title: title, message: messages)
                   return
               }
               
        performSegue(withIdentifier: "suge", sender: nil)
    }
}


extension filterVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return subCat.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return subCat[row].name
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        catTF.text = subCat[row].name
        catsId = subCat[row].id
        //self.view.endEditing(false)
        
    }
}
