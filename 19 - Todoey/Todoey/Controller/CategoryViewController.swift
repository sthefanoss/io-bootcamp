//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Sthefano Schiavon on 25/06/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

class CategoryViewController : UITableViewController {
    var selecedRow : Int!
    var categoriesManager = CategoriesManager()
    
    override func viewDidLoad() {
        categoriesManager.load()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        weak var textView : UITextField!
        let alert = UIAlertController(title: "Add new Todoey Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.categoriesManager.insert(description:textView.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField() { (newTextView) in
            textView = newTextView
            newTextView.placeholder = "Create new category"
        }
        
        alert.addAction(action)
        
        present(alert,animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return categoriesManager.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = categoriesManager.categories[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selecedRow = indexPath.row
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItems"{
            (segue.destination as! ItemsViewController).category = categoriesManager.categories[selecedRow]
        }
    }
}
