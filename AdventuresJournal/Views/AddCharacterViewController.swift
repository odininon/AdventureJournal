//
//  AddCharacterViewController.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/17/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import UIKit

class AddCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Add Character"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddCharacter))
    }
    
    @objc func cancelAddCharacter() {
        dismiss(animated: true, completion: nil)
    }
}
