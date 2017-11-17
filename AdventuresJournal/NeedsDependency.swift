//
//  NeedsDependency.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/17/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import Foundation
import Coordinator

protocol NeedsDependency: class {
    var dependencies: AppDependency? { get set }
}

extension NeedsDependency where Self: Coordinating {
    func updateChildCoordinatorDependencies() {
        self.childCoordinators.forEach { (_, coordinator) in
            if let c = coordinator as? NeedsDependency {
                c.dependencies = dependencies
            }
        }
    }
}
