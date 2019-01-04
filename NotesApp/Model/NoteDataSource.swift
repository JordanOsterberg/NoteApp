//
//  NoteDataStore.swift
//  NotesApp
//
//  Created by Jordan Osterberg on 12/31/18.
//  Copyright © 2018 Jordan Osterberg. All rights reserved.
//

import Foundation

class NoteDataSource: DataSource {
    
    var notes: [Note] {
        return [
            Note(content: "Apple Park Visit\n\nRemember to pack food for the long road trip!\n\nWe will need...\n\n- Protein Bars\n- Plently of Water\n- Apples\n\nAddress is 1 Apple Park Way")
        ]
    }
    
    init() {
        // Load our data
    }
    
    func store<T>(object: T) {
        guard let note = object as? Note else {
            return
        }
        
        // Save our note
        
        NotificationCenter.default.post(name: .noteDataChanged, object: nil)
    }
    
    func delete<T>(object: T) {
        guard let note = object as? Note else {
            return
        }
        
        // Delete our note
        
        NotificationCenter.default.post(name: .noteDataChanged, object: nil)
    }
    
}

extension Notification.Name {
    
    static let noteDataChanged = Notification.Name(rawValue: "noteDataChanged")
    
}
