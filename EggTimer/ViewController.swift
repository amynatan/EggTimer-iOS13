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
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle! //this is going to be either "Soft", "Hard" or "Medium"
        
        print(eggTimes[hardness]!) //dictionaries will always prouce optional int in case we misspell the key so it's necessary to confirm that there are no typos by unwrapping the result (!)
      
}
}
