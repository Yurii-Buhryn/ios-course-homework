//
//  CellController.swift
//  02-notebook
//
//  Created by Admin on 08/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class CellController: UIViewController{
    
    var noteName: String!
    var noteText: String!
    
    @IBOutlet weak var tilteInput: UITextField!
    
    @IBOutlet weak var textInput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tilteInput.text = noteName
        textInput.text = noteText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
