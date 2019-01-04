//
//  DataSource.swift
//  NotesApp
//
//  Created by Jordan Osterberg on 1/1/19.
//  Copyright © 2019 Jordan Osterberg. All rights reserved.
//

import Foundation

protocol DataSource {
    
    func store<T>(object: T)
    func delete<T>(object: T)
    
}

