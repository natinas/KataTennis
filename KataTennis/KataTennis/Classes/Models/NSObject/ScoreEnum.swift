//
//  ScoreEnum.swift
//  KataTennis
//
//  Created by Mobile Factory on 08/01/2019.
//  Copyright © 2019 altran. All rights reserved.
//

import Foundation

enum ScoreEnum : String {
    case Love = "Love"
    case Fifteen = "Fifteen"
    case Thirty = "Thirty"
    case Forty = "Forty"
    case Deuce = "Deuce"
    
    //MARK: - Public method
    static func score(value : Int) -> ScoreEnum {
        switch value {
        case 0:
            return .Love
        case 1:
            return .Fifteen
        case 2:
            return .Thirty
        case 3:
            return .Forty
        default:
            return .Deuce
        }
    }
}
