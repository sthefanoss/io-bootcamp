//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let itemsManager = ItemsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsManager.load()
        tableView.register(
            UINib(nibName: "ItemTableViewCell", bundle: nil),
            forCellReuseIdentifier: "ItemTableViewCell"
        )
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsManager.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
        cell.delegate = self
        cell.update(value: itemsManager.items[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        weak var textView : UITextField!
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemsManager.insert(description:textView.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField() { (newTextView) in
            textView = newTextView
            newTextView.placeholder = "Create new item"
        }
        
        alert.addAction(action)
        
        present(alert,animated: true)
    }
}

extension TodoListViewController:ItemTableViewCellDelegate {
    func deleteCall(_ item: ItemEntity) {
        let alert = UIAlertController(title: "Are you sure?", message: "", preferredStyle: .alert)
        
        let actionNo = UIAlertAction(title: "No", style: .default) { (action) in print("No") }
        let actionYes = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.itemsManager.delete(item)
            self.tableView.reloadData()
        }
    
        alert.addAction(actionNo)
        alert.addAction(actionYes)
        
        present(alert,animated: true)
    }
    
    func toggleCall(_ item: ItemEntity) {
        itemsManager.toggle(item)
        tableView.reloadData()
    }
}
