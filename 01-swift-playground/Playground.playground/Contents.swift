import UIKit


class Note : CustomStringConvertible {
    let date : Date
    var name : String?
    var text : String?
    var tags : Set<String> = []
    
    init() {
        date = Date()
    }
    
    init(date : Date) {
        self.date = date
    }
    
    init(date : Date, name : String) {
        self.date = date
        self.name = name
    }
    
    init(date : Date, name : String, text : String) {
        self.date = date
        self.name = name
        self.text = text
    }
    
    init(date : Date, name : String, text : String, tags : Set<String>) {
        self.date = date
        self.name = name
        self.text = text
        self.tags = tags
    }
    
    var description: String {
        return fullDescription()
    }
    
    func fullDescription() -> String {
        return fullDescription(dataStyle: DateFormatter.Style.long)
    }
    
    func fullDescription(dataStyle style : DateFormatter.Style) -> String {
        return getDate(date: date, dataStyle: style)
            + unwrap(name)
            + unwrap(text)
            + unwrap(tagsDescription())
    }
    
    private func getDate(date : Date, dataStyle style : DateFormatter.Style) -> String {
        let diff = Calendar.current.dateComponents([Calendar.Component.day], from: Date(), to: date).day ?? 0
        return diff == 0 ? "Today " : diff == -1 ? "Yesterday" : dateFormatter(style).string(from: date)
    }
    
    private func dateFormatter(_ style : DateFormatter.Style) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter
    }
    
    private func unwrap(_ str : String?) -> String {
        if str == nil {
            return ""
        } else {
            return "\n" + str!
        }
    }
    
    private func tagsDescription() -> String? {
        if(tags.isEmpty) {
            return nil
        } else {
            var results = ""
            
            for (index, tag) in tags.enumerated() {
                results =  results + "[" + tag + "]"
                
                if(index + 1 < tags.count) {
                    results = results + " "
                }
            }
            
            return results;
        }
    }

}

var plusOneDay = DateComponents()
plusOneDay.day = 1
plusOneDay.minute = 1

var plusTwoDay = DateComponents()
plusTwoDay.day = 2
plusTwoDay.minute = 1

var minusOneDay = DateComponents()
minusOneDay.day = -1
minusOneDay.minute = -1

let note1 = Note()
let note2 = Note(date: Calendar.current.date(byAdding: plusOneDay, to: Date()) ?? Date())
let note3 = Note(date: Calendar.current.date(byAdding: plusTwoDay, to: Date()) ?? Date(), name: "Note 1")
let note4 = Note(date: Calendar.current.date(byAdding: minusOneDay, to: Date()) ?? Date(), name: "Note 2", text: "some text")
let note5 = Note(date: Date(), name: "Note 3", text: "some text", tags : ["tag1", "tag3", "tag2"])
let note6 = Note(date: Date(), name: "Note 4", text: "some text", tags : ["tag1"])

let notes = [note1, note2, note3, note4, note5, note6].sorted(by: {$0.date > $1.date})

for note in notes {
    print("---------------------")
    print(note)
}


