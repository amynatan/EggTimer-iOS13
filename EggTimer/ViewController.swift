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
    
 /* let softTime = 5
    let mediumTime = 7
    let hardTime = 12*/
    
    // instead of declaring several constants, we can create a dictionary.
    //If using several constants, we could use either a switch or an if else statement
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer() //this was only created so we can call the timer
    var player: AVAudioPlayer!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        
        timer.invalidate() //this stops any timer that's running when the button is pressed
        
        //the hardness constant allows us to assign the current tytle of the button to other things
        let hardness = sender.currentTitle! //this is going to be either "Soft", "Hard" or "Medium"
        totalTime = eggTimes[hardness]!
        
                        //here hardness will be replaced with the button title which is the same as the dictionary key
        totalTime = eggTimes[hardness]! //dictionaries will always prouce optional int in case we misspell the key so it's necessary to confirm that there are no typos by unwrapping the result (!)
        
        progressBar.progress = 0.0
        secondsPassed = 0
        mainLabel.text = hardness
        
        //Timer.scheduledTimer would have worked without the timer variable. it's only there so we can trigger it and stop it
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
}
    

@objc func updateTimer() {
    
    if secondsPassed < totalTime {
        secondsPassed += 1
        let percentageProgress = Float(secondsPassed) / Float(totalTime)
        progressBar.progress = percentageProgress
        
    } else {
        timer.invalidate()
        mainLabel.text = "Done!"
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
}


