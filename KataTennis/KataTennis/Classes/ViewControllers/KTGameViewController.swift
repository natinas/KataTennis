//
//  KTGameViewController.swift
//  KataTennis
//
//  Created by Mobile Factory on 08/01/2019.
//  Copyright © 2019 altran. All rights reserved.
//

import UIKit

class KTGameViewController: UIViewController, GameDelegate {

    //MARK: - IBOutlet
    @IBOutlet var _pointPlayer1Label: UILabel!
    @IBOutlet var _pointPlayer2Label: UILabel!
    @IBOutlet var _scorePlayer1Label: UILabel!
    @IBOutlet var _scorePlayer2Label: UILabel!
    
    //MARK: - IBInspectable
    @IBInspectable var congratulationSegue : String?
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()

        KTGameManager.shared.delegate = self
        KTGameManager.shared.startGame()
        
        self._resetPointPlayer()
        self._scorePlayer1Label.text = "0"
        self._scorePlayer2Label.text = "0"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        KTGameManager.shared.stopGame()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc : KTCongratulationViewController = segue.destination as? KTCongratulationViewController,
            let hasPlayer1Win : Bool = sender as? Bool {
            vc.hasPlayer1Win = hasPlayer1Win
        }
    }
    
    //MARK: - Private Method
    private func _resetPointPlayer() {
        self._pointPlayer1Label.text = ScoreEnum.score(value: 0).rawValue
        self._pointPlayer2Label.text = ScoreEnum.score(value: 0).rawValue
    }
    
    //MARK: - GameDelegate
    func point(pointPlayer1: Int, pointPlayer2: Int) {
        
        self._pointPlayer1Label.text = ScoreEnum.score(value: pointPlayer1).rawValue
        self._pointPlayer2Label.text = ScoreEnum.score(value: pointPlayer2).rawValue
        
    }
    func score(scorePlayer1: Int, scorePlayer2: Int, end: Bool) {
        
        self._resetPointPlayer()
        
        self._scorePlayer1Label.text = "\(scorePlayer1)"
        self._scorePlayer2Label.text = "\(scorePlayer2)"
        
        if end {
            
            if let congratulationSegue : String = self.congratulationSegue {
                self.performSegue(withIdentifier: congratulationSegue, sender: scorePlayer1 > scorePlayer2)
            }
            
        }
        
    }

}
