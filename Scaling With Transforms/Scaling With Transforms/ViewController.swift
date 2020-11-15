//
//  ViewController.swift
//  Scaling With Transforms
//
//  Created by Akshansh Thakur on 15/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballView: BallView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ballView.setupUI()
    }
}

class BallView: UIView {
    
    enum ScaleState {
        case scaledUp
        case scaledDown
    }
    
    @IBOutlet weak var ball: UIView!
    @IBOutlet weak var scaleButton: UIButton!
    
    var scaledState = ScaleState.scaledDown
    
    func setupUI() {
        
        scaleButton.addTarget(self, action: #selector(scaleBall(_:)), for: .touchUpInside)
        
    }
    
    @objc func scaleBall(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            if self.scaledState == .scaledDown {
                self.ball.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            } else {
                self.ball.transform = .identity
            }
        } completion: { (value) in
            self.scaledState = (self.scaledState == .scaledDown) ? .scaledUp : .scaledDown
        }
        
    }
    
}

