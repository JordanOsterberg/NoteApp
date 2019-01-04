//
//  Note.swift
//  NotesApp
//
//  Created by Jordan Osterberg on 12/30/18.
//  Copyright © 2018 Jordan Osterberg. All rights reserved.
//

import Foundation

class Note {
    
    var identifier: String
    var content: String
    var lastEdited: Date
    
    init(
         identifier: String = UUID().uuidString,
         content: String,
         lastEdited: Date = Date()) {
        self.identifier = identifier
        self.content = content
        self.lastEdited = lastEdited
    }
    
}

extension Note {
    
    convenience init(realmNote: RealmNote) {
        self.init(identifier: realmNote.identifier, content: realmNote.content, lastEdited: realmNote.lastEdited)
    }
    
    var realmNote: RealmNote {
        return RealmNote(note: self)
    }
    
}

extension Note: Writable {
    
    func write(dataSource: DataSource) {
        self.lastEdited = Date()
        
        dataSource.store(object: self)
    }
    
    func delete(dataSource: DataSource) {
        dataSource.delete(object: self)
    }
    
}
