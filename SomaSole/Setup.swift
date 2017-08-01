//
//  Setup.swift
//  SomaSole
//
//  Created by Matthew Rigdon on 7/31/17.
//  Copyright © 2017 SomaSole. All rights reserved.
//

import Foundation
import RealmSwift

class Setup: Object {
    
    // MARK: - Object properties
    
    dynamic var imageIndex = 0
    dynamic var long = false
    
    // MARK: - Ignored properties
    
    dynamic var image: UIImage {
        return UIImage(named: "setup\(imageIndex)\(long ? "long" : "short")")!
    }
    
    // MARK: - Initializers
    
    convenience init(data: [String : Int]) {
        self.init()
        
        imageIndex = data["legacy_index"]!
        long = Bool(data["length"]!)
    }
    
    // MARK: - Overridden methods
    
    override static func ignoredProperties() -> [String] {
        return ["image"]
    }
    
}
