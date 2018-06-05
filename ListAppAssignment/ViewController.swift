//
//  ViewController.swift
//  ListAppAssignment
//
//  Created by Daniel Aditya Istyana on 6/4/18.
//  Copyright © 2018 Daniel Aditya Istyana. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var items = ["Sendal", "Sepatu", "Kemeja", "Kaos", "Dasi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Daftar"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as UITableViewCell?
        cell?.textLabel?.text = items[indexPath.row]
        return cell!
    }
    
    @objc func addNewItem() {
        
        let ac = UIAlertController(title: "Add new item", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            let textField = ac.textFields![0] as UITextField
            
            // Insert at the beginning of array
            self.items.insert(textField.text!, at: 0)
            
            // Insert new row from top instead of reloading tableview
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            print(self.items)
            
            // Dont need reload all tableview since we need only inserting the items
            // self.tableView.reloadData()
        }
        
        ac.addTextField { (textField) in
            textField.placeholder = "Enter your item"
        }
        
        ac.addAction(action)
        
        self.present(ac, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.items.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}

