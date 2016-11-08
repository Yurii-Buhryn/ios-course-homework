//
//  Note.swift
//  02-notebook
//
//  Created by Admin on 08/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//
import UIKit

class Note {
    let date : Date
    var name : String?
    var text : String?
    
    init(date : Date, name : String, text : String) {
        self.date = date
        self.name = name
        self.text = text
    }
    
    func getDate(dataStyle style : DateFormatter.Style) -> String {
        let diff = Calendar.current.dateComponents([Calendar.Component.day], from: Date(), to: date).day ?? 0
        return diff == 0 ? "Today " : diff == -1 ? "Yesterday" : dateFormatter(style).string(from: date)
    }
    
    private func dateFormatter(_ style : DateFormatter.Style) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter
    }
    
}
