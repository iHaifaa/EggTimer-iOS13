//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
// Modified by Haifaa

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft":3, "Medium":4, "Hard":7]
    var totalTime = 0
    var passedSeconds = 0
    var timer = Timer()
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate() // to stop the timer
        // currentTitle is an optional string, while in eggTimes key is a string
        //so we need to wnrap the hardness
        let hardness = sender.currentTitle!
        // we need to unwrap the dictionary because it always returns optional
        totalTime = eggTimes[hardness]!

        progressBar.progress = 0.0
        passedSeconds = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(updateTimer),
                             userInfo: nil,
                             repeats: true)
}

 @objc   func updateTimer (){
        if passedSeconds <= totalTime {
            print("\(passedSeconds) seconds. ")
            
            progressBar.progress = Float (passedSeconds) / Float (totalTime)
            passedSeconds += 1

        }else {
            progressBar.progress = 0.0
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
}
