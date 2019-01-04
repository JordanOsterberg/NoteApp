//
//  Writable.swift
//  NotesApp
//
//  Created by Jordan Osterberg on 12/31/18.
//  Copyright © 2018 Jordan Osterberg. All rights reserved.
//

import Foundation

protocol Writable {
    
    func write(dataSource: DataSource)
    func delete(dataSource: DataSource)
    
}

