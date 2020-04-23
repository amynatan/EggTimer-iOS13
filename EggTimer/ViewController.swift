//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 /* let softTime = 5
    let mediumTime = 7
    let hardTime = 12*/
    
    // instead of declaring several constants, we can create a dictionary.
    //If using several constants, we could use either a switch or an if else statement
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var counter = 60
    
    var timer = Timer() //this was only created so we can call the timer

    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        
        
        timer.invalidate() //this stops any timer that's running when the button is pressed
        
        //the hardness constant allows us to assign the current tytle of the button to other things
        let hardness = sender.currentTitle! //this is going to be either "Soft", "Hard" or "Medium"
      
                        //here hardness will be replaced with the button title which is the same as the dictionary key
        counter = eggTimes[hardness]! //dictionaries will always prouce optional int in case we misspell the key so it's necessary to confirm that there are no typos by unwrapping the result (!)
        
        //Timer.scheduledTimer would have worked without the timer variable. it's only there so we can trigger it and stop it
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
}

    

@objc func updateCounter() {
    //example functionality
    if counter > 0 {
        print("\(counter) seconds")
        counter -= 1
    } else {
        timer.invalidate()
        mainLabel.text = "Done"
        
    }
}
}


