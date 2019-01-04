//
//  String+Truncation.swift
//  NotesApp
//
//  Created by Jordan Osterberg on 12/31/18.
//  Copyright © 2018 Jordan Osterberg. All rights reserved.
//

import Foundation

extension String {
    
    func truncate(length: Int, trailing: String = "…") -> String {
        if self.count > length {
            return String(self.prefix(length)) + trailing
        } else {
            return self
        }
    }
    
}
