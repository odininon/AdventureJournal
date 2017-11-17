//
//  AppDependency.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/17/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import Foundation

struct AppDependency {
    var characterManager: CharacterManager?
    var adventuresManager: AdventuresManager?
    
    init(characterManager: CharacterManager? = nil,
         adventuresManager: AdventuresManager? = nil) {
        self.characterManager = characterManager
        self.adventuresManager = adventuresManager
    }
}
