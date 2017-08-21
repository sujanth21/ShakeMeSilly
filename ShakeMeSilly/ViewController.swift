//
//  ViewController.swift
//  ShakeMeSilly
//
//  Created by Sujanth Sebamalaithasan on 21/8/17.
//  Copyright © 2017 Sujanth Sebamalaithasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    var timer = Timer()
    var timeInt = 10
    var scoreInt = 0
    var imageInt = 1
    var modeInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func startBtnPressed(_ sender: Any) {
        
        if timeInt == 10 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true)
            
            modeInt = 1
            startBtn.isEnabled = false
            startBtn.alpha = 0.25
        } else if timeInt == 0 {
            scoreInt = 0
            timeInt = 10
            
            scoreLabel.text = String(scoreInt)
            timerLabel.text = String(timeInt)
            imageView.image = UIImage(named: "Maracas1")
            
            startBtn.setTitle("Start Game", for: .normal)
        }
        
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            
            if modeInt == 1 {
                
                scoreInt += 1
                scoreLabel.text = String(scoreInt)
                
                imageInt += 1
                
                if imageInt == 5 {
                    imageInt = 1
                }
                
                imageView.image = UIImage(named: "Maracas\(imageInt)")
            }
        }
    }
    
    
    @objc func startCounter() {
        
        timeInt -= 1
        timerLabel.text = String(timeInt)
        
        if timeInt == 0 {
            timer.invalidate()
            modeInt = 0
            startBtn.isEnabled = true
            startBtn.alpha = 1.0
            startBtn.setTitle("Restart Game", for: .normal)
        }
    }
    
    
    

}

