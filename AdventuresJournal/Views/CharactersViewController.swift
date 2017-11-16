//
//  CharactersViewController.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/15/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import UIKit

class CharactersViewController: UITableViewController {
    var characters = [AECharacter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characters.append(AECharacter(name: "Boris"))
        characters.append(AECharacter(name: "Pavel"))
        self.tableView.reloadData()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Characters"
        
        tableView.backgroundColor = .white
        tableView.separatorColor = .black
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        
        let characterView = CharacterTabViewController(character: character)
        
        navigationController?.pushViewController(characterView, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor = .white
        
        let character = characters[indexPath.row]
        
        cell.textLabel?.text = character.name
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
}
