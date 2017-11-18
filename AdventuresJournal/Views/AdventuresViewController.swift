//
//  AdventuresViewController.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/17/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import UIKit

class AdventuresViewController: UITableViewController {
    var character: AECharacter? {
        didSet {
            if !self.isViewLoaded { return }
            updateData()
        }
    }
    
    var adventures: [AEAdventure]? {
        didSet {
            if !self.isViewLoaded { return }
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        tableView.separatorColor = .black
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        updateData()
    }
    
    func updateData() {
        guard let character = character else { return }
        
        fetchAdventures(for: character, sender: self) { [weak self](adventures, _) in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                self.adventures = adventures
            }
        }
    }
}

extension AdventuresViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let adventures = adventures else { return }
        
        let adventure = adventures[indexPath.row]
        
        showAdventure(adventure, sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        guard let adventures = adventures else { return cell}
        
        cell.backgroundColor = .white
        
        let adventure = adventures[indexPath.row]
        
        cell.textLabel?.text = adventure.name
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adventures?.count ?? 0
    }
}
