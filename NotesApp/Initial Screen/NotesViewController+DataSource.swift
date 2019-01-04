//
//  NotesViewController+DataSource.swift
//  NotesApp
//
//  Created by Jordan Osterberg on 12/30/18.
//  Copyright © 2018 Jordan Osterberg. All rights reserved.
//

import UIKit

extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableCell.identifier, for: indexPath) as! NoteTableCell
        cell.note = self.notes[indexPath.row]
        
        cell.layoutIfNeeded() // This will ensure labels don't get cut off
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }
    
}
