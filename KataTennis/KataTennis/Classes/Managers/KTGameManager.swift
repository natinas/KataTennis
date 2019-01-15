//
//  KTGameManager.swift
//  KataTennis
//
//  Created by Mobile Factory on 08/01/2019.
//  Copyright © 2019 altran. All rights reserved.
//

import UIKit

class KTGameManager : GameDelegate {

    //MARK: - Variables
    static var shared : KTGameManager = {
        return KTGameManager()
    }()
    var game : KTGame = KTGame()
    var delegate : GameDelegate?
    
    //MARK: - Public Method
    func startGame() {
        self.game.delegate = self
        self.game.launcGame()
    }
    
    func stopGame() {
        self.game.stopGame()
        self.game = KTGame()
    }
    
    //MARK: - GameDelegate
    func point(pointPlayer1: Int, pointPlayer2: Int) {
        self.delegate?.point(pointPlayer1: pointPlayer1, pointPlayer2: pointPlayer2)
    }
    func score(scorePlayer1: Int, scorePlayer2: Int, end : Bool) {
        self.delegate?.score(scorePlayer1: scorePlayer1, scorePlayer2: scorePlayer2, end: end)
    }
    
}
