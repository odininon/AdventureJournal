//
//  AdventuresManager.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/17/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import Foundation

final class AdventuresManager {
    fileprivate(set) var adventures: [String: [AEAdventure]] = {
        let boris = [AEAdventure(name: "Starting")]
        let pavel = [AEAdventure(name: "Starting"), AEAdventure(name: "Lost Mine")]
        return ["Boris": boris, "Pavel": pavel]
    }()
    
    func adventures(_ character: AECharacter, callback: @escaping ([AEAdventure], Error?) -> Void) {
        callback(adventures[character.name] ?? [], nil)
    }
}
