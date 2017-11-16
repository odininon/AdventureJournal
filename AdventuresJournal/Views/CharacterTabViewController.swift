//
//  CharacterTabViewController.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/15/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import UIKit


class CharacterTabViewController : UITabBarController {
    let character: AECharacter
    
    init(character: AECharacter) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = character.name
        
        let adventures = UIViewController()
        adventures.tabBarItem = UITabBarItem(title: "Adventures", image: nil, selectedImage: nil)
        
        setViewControllers([adventures], animated: true)
    }
}
