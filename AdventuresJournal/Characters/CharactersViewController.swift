//
//  CharactersViewController.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 12/2/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import UIKit

protocol CharactersViewControllerDelegate: class  {
    func showCharacter(_ character: String)
    func showAddCharacter()
}

class CharactersViewController: AETableViewController {
    var delegate: CharactersViewControllerDelegate?
    
    var characters: [String] = [] {
        didSet {
            if !self.isViewLoaded { return }
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toggleAddCharacterView))

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    @objc func toggleAddCharacterView() {
        delegate?.showAddCharacter()
    }
}


extension CharactersViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        
        delegate?.showCharacter(character)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor = .white
        
        let character = characters[indexPath.row]
        
        cell.textLabel?.text = character
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
}
