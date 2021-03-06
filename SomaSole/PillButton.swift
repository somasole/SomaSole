//
//  PillButton.swift
//  SomaSole
//
//  Created by Matthew Rigdon on 4/10/16.
//  Copyright © 2016 SomaSole. All rights reserved.
//

import UIKit

@IBDesignable
class PillButton: UIButton {
    
    var blackColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    var blueColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5)
    
    var selectedByUser: Bool = false
    var workoutTag: WorkoutTag?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = blackColor
        self.layer.cornerRadius = 5
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if !selectedByUser {
            self.backgroundColor = blueColor
            selectedByUser = true
        }
        else {
            self.backgroundColor = blackColor
            selectedByUser = false
        }
    }
    
    func setSelected() {
        self.backgroundColor = blueColor
        selectedByUser = true
    }
    
    func makeOpaque() {
        blackColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        blueColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        
        self.backgroundColor = selectedByUser ? blueColor : blackColor
    }

}
