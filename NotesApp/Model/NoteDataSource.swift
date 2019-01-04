//
//  NoteDataStore.swift
//  NotesApp
//
//  Created by Jordan Osterberg on 12/31/18.
//  Copyright © 2018 Jordan Osterberg. All rights reserved.
//

import Foundation
import RealmSwift

class NoteDataSource: DataSource {
    
    var notes: [Note] {
        let objects = realm.objects(RealmNote.self).sorted(byKeyPath: "lastEdited", ascending: false)
        
        return objects.map {
            return $0.note
        }
    }
    
    var realm: Realm
    
    init() {
        // Load our data
        self.realm = try! Realm()
    }
    
    func store<T>(object: T) {
        guard let note = object as? Note else {
            return
        }
        
        // Save our note
        try? self.realm.write {
            self.realm.add(note.realmNote, update: true)
        }
        
        NotificationCenter.default.post(name: .noteDataChanged, object: nil)
    }
    
    func delete<T>(object: T) {
        guard let note = object as? Note else {
            return
        }
        
        // Delete our note
        if let realmNote = self.realm.object(ofType: RealmNote.self, forPrimaryKey: note.identifier) {
            self.realm.beginWrite()
            self.realm.delete(realmNote)
            try? self.realm.commitWrite()
        }
        
        NotificationCenter.default.post(name: .noteDataChanged, object: nil)
    }
    
}

extension Notification.Name {
    
    static let noteDataChanged = Notification.Name(rawValue: "noteDataChanged")
    
}
