//
//  AddCharacterViewController.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 12/2/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import UIKit

protocol AddCharacterViewControllerDelegate: class {
    func saveCharacter(_ character: String)
}

class AddCharacterViewController : UIViewController {
    var delegate: AddCharacterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveCharacter))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelCharacter))
    }
    
    @objc func saveCharacter() {
        delegate?.saveCharacter("Boris2")
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelCharacter() {
        self.dismiss(animated: true, completion: nil)
    }
}
