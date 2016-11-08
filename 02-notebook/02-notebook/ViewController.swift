//
//  ViewController.swift
//  02-notebook
//
//  Created by Admin on 07/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var notes : Array<Note>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        notes = Array()
        
        notes.append(Note(date: Date(), name: "Test Note 1", text: "Test Text 1"))
        notes.append(Note(date: dateFormatter.date(from : "1992-12-09")!, name: "Test Note 2", text: "Test Text 2"))
        notes.append(Note(date: dateFormatter.date(from : "1993-12-09")!, name: "Test Note 3", text: "Test Text 3"))
        notes.append(Note(date: dateFormatter.date(from : "1994-12-09")!, name: "Test Note 4", text: "Test Text 4"))
        notes.append(Note(date: dateFormatter.date(from : "1995-12-09")!, name: "Test Note 5", text: "Test Text 5"))
        notes.append(Note(date: dateFormatter.date(from : "1996-12-09")!, name: "Test Note 6", text: "Test Text 6"))
        
        notes = notes.sorted(by: {$0.date > $1.date})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToCell") {
            let destination = segue.destination as! CellController
            
            destination.title = notes[tableView.indexPathForSelectedRow!.row].getDate(dataStyle: DateFormatter.Style.long)
            destination.noteName = notes[tableView.indexPathForSelectedRow!.row].name!
            destination.noteText = notes[tableView.indexPathForSelectedRow!.row].text!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.noteName.text = notes[indexPath.row].name
        cell.noteDate.text = notes[indexPath.row].getDate(dataStyle: DateFormatter.Style.long)
        
        return cell
    }

}

