//
//  ViewController.swift
//  03-core-data
//
//  Created by Admin on 09/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addBtn: UIButton!
    
    var notes = [NSManagedObject]()
    //var names = ["Test 1", "Test 2", "Test 3"]
    //var dates = ["12/09/1992", "12/09/1991", "12/09/1993"]
    
    @IBAction func addCell(_ sender: Any) {
        let alert = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action: UIAlertAction!) -> Void in
            let textField = alert.textFields![0]
            self.saveNote(name: textField.text!)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) {
            (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextField {
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveNote(name: String) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity =  NSEntityDescription.entity(forEntityName: "Note", in: context)
        let note = NSManagedObject(entity: entity!, insertInto: context)
        
        note.setValue(name, forKey: "name")
        note.setValue("Today", forKey: "date")
        
        do {
            try context.save()
        } catch {
            print("Save error")
        }
        
        notes.append(note)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Load !!!!")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Note")
                
        do {
            let fetchedResults = try context.fetch(fetchRequest) as? [NSManagedObject]
            notes = fetchedResults!
        } catch {
            print("Fetch error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        
        
        let note = notes[indexPath.row]
        
        cell.nameLabel.text = note.value(forKey: "name") as? String
        cell.dateLabel.text = note.value(forKey: "date") as? String
        
        return cell
    }


}

