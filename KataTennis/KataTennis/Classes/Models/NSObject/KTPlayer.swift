//
//  KTPlayer.swift
//  KataTennis
//
//  Created by Mobile Factory on 08/01/2019.
//  Copyright © 2019 altran. All rights reserved.
//

import UIKit
import Foundation

class KTPlayer {

    //MARK: - Variables
    var point : Int = 0
    var score : Int = 0
    
    //MARK: - Public Method
    func winPoint() {
        self.point += 1
    }
    
    func loosePoint() {
        self.point -= 1
    }
    
    func winScore() {
        self.score += 1
    }
    
    func resetPoint() {
        self.point = 0
    }
}
