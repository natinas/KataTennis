//
//  KTGame.swift
//  KataTennis
//
//  Created by Mobile Factory on 08/01/2019.
//  Copyright © 2019 altran. All rights reserved.
//

import UIKit

protocol GameDelegate {
    func point(pointPlayer1 : Int, pointPlayer2 : Int)
    func score(scorePlayer1 : Int, scorePlayer2 : Int, end : Bool)
}
class KTGame {

    //MARK: - Variables
    private var _player1 : KTPlayer = KTPlayer()
    private var _player2 : KTPlayer = KTPlayer()
    private var _endGame : Bool = false
    private var _timer : Timer?
    
    var delegate : GameDelegate?
    
    //MARK: - public method
    func launcGame() {
        self._startGame()
    }
    
    func stopGame() {
        self._timer?.invalidate()
    }
    
    //MARK: - Private Method
    private func _startGame() {
        
        self._timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            self._player1WinPoint()
        }
        
    }
    
    private func _player1WinPoint() {
        if arc4random_uniform(2) == 0 {
            if self._player2.point == 4  && self._player1.point == 3 {
                self._player2.loosePoint()
            } else {
                self._player1.winPoint()
            }
        } else {
            if self._player1.point == 4  && self._player2.point == 3 {
                self._player1.loosePoint()
            } else {
                self._player2.winPoint()
            }
        }
        if self._checkScore() {
            self.delegate?.point(pointPlayer1: self._player1.point, pointPlayer2: self._player2.point)
        } else {
            self.delegate?.score(scorePlayer1: self._player1.score, scorePlayer2: self._player2.score, end: self._endGame)
            self._resetPlayer()
        }
        
    }

    private func _checkScore() -> Bool {
        
        if self._player1.point == 4 && self._player2.point < 3 || self._player1.point == 5{
            self._player1.winScore()
        } else if self._player2.point == 4 && self._player1.point < 3 || self._player2.point == 5{
            self._player2.winScore()
        } else {
            return true
        }
        
        self._checkGame()
        return false
    }
    
    private func _checkGame() {
        
        if self._player1.score >= self._player2.score + 2 && self._player1.score >= 4 || self._player2.score >= self._player1.score + 2 && self._player2.score >= 4 {
            self._endGame = true
            self.stopGame()
        }
        
    }
    
    private func _resetPlayer() {
        self._player1.resetPoint()
        self._player2.resetPoint()
    }
}
