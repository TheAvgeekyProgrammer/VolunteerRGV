//
//  InterestButton.swift
//  VolunteerRGV
//
//  Created by Aaron Jacob on 2/7/20.
//  Copyright © 2020 Science Academy TSA. All rights reserved.
//

import UIKit

class InterestButton: UIButton {

    //Toggle buttons on interests screen
    var isOn = false

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }

    func initButton() {
        addTarget(self, action: #selector(InterestButton.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        let color = bool ? UIColor(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1) : UIColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        backgroundColor = color
        
    }
    
}
