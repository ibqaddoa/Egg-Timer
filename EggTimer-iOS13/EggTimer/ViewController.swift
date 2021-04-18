//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var progBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    var totalTime: Float = 0
    var secondsPassed: Float = 0
    var player: AVAudioPlayer!
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = Float(eggTimes[hardness]!)
        
        progBar.progress = 0.0
        secondsPassed = 0.0
        mainLabel.text = sender.currentTitle
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                             selector: #selector(updateCounter), userInfo: nil, repeats: true)

        
    }
    
    func playSound(soundLetter: String) {
        let url = Bundle.main.url(forResource: soundLetter, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progBar.progress = secondsPassed / totalTime
            
        }else {
            timer.invalidate()
            mainLabel.text = "DONE!"
            playSound(soundLetter: "alarm_sound")
        }
    }

}
