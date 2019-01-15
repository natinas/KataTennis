//
//  KTCongratulationViewController.swift
//  KataTennis
//
//  Created by Mobile Factory on 08/01/2019.
//  Copyright © 2019 altran. All rights reserved.
//

import UIKit

class KTCongratulationViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet var _playerWinLabel: UILabel!
    
    //MARK: - IBInspectable
    @IBInspectable var homeSegue : String?
    
    //MARK: - Variables
    var hasPlayer1Win : Bool = false
    let emitterLayerBaseCell : CAEmitterLayer = CAEmitterLayer()
    let cell : CAEmitterCell = CAEmitterCell()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (timer) in
            if let homeSegue : String = self.homeSegue {
                self.performSegue(withIdentifier: homeSegue, sender: nil)
            }
        }
        
        if self.hasPlayer1Win {
            self._playerWinLabel.text = NSLocalizedString("game_player1_win_label", comment: "")
        } else {
            self._playerWinLabel.text = NSLocalizedString("game_player2_win_label", comment: "") 
        }
        
        self.setupBaseLayer()
        self.launchFireworks()
        
    }
    
    //MARK: - Public method
    func setupBaseLayer()
    {
        // Add a layer that emits, animates, and renders a particle system.
        let size : CGSize = view.bounds.size
        self.emitterLayerBaseCell.emitterPosition = CGPoint(x: size.width / 2, y: size.height - 100)
        self.emitterLayerBaseCell.renderMode = CAEmitterLayerRenderMode.additive
        self.emitterLayerBaseCell.zPosition = -1
        view.layer.addSublayer(self.emitterLayerBaseCell)
        
    }
    
    func launchFireworks()
    {
        // Get particle image
        if let particleImage : CGImage = UIImage(named: "particle")?.cgImage {
            
            // The definition of a particle (launch point of the firework)
            let baseCell : CAEmitterCell = CAEmitterCell()
            baseCell.color = UIColor.gray.cgColor
            baseCell.emissionLongitude = -CGFloat.pi / 2
            baseCell.emissionRange = CGFloat.pi / 5
            baseCell.lifetime = 2.0
            baseCell.birthRate = 1
            baseCell.velocity = 400
            baseCell.velocityRange = 50
            baseCell.yAcceleration = 300
            baseCell.redRange   = 1
            baseCell.greenRange = 1
            baseCell.blueRange  = 1
            baseCell.alphaRange = 1
            
            // The definition of a particle (rising animation)
            let risingCell : CAEmitterCell = CAEmitterCell()
            risingCell.contents = particleImage
            risingCell.emissionLongitude = (4 * CGFloat.pi) / 2
            risingCell.emissionRange = CGFloat.pi / 7
            risingCell.scale = 0.4
            risingCell.velocity = 100
            risingCell.birthRate = 50
            risingCell.lifetime = 1.5
            risingCell.yAcceleration = 350
            risingCell.alphaSpeed = -0.7
            risingCell.scaleSpeed = -0.1
            risingCell.scaleRange = 0.1
            risingCell.beginTime = 0.01
            risingCell.duration = 0.7
            
            // The definition of a particle (spark animation)
            let sparkCell : CAEmitterCell = CAEmitterCell()
            sparkCell.contents = particleImage
            sparkCell.emissionRange = 2 * CGFloat.pi
            sparkCell.birthRate = 10000
            sparkCell.scale = 0.5
            sparkCell.velocity = 130
            sparkCell.lifetime = 3.0
            sparkCell.yAcceleration = 80
            sparkCell.beginTime = 1.5
            sparkCell.duration = 0.1
            sparkCell.alphaSpeed = -0.1
            sparkCell.scaleSpeed = -0.1
            
            // baseCell contains rising and spark particle
            baseCell.emitterCells = [risingCell, sparkCell]
            
            // Add baseCell to the emitter layer
            self.emitterLayerBaseCell.emitterCells = [baseCell]
        }
    }

}
