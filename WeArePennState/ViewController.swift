//
//  ViewController.swift
//  WeArePennState
//
//  Created by Kelly Hutchison on 10/21/15.
//  Copyright © 2015 Kelly Hutchison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var chantButton: UIButton!
    @IBOutlet weak var weAreLabel: UILabel!
    @IBOutlet weak var pennStateLabel: UILabel!
    @IBOutlet weak var lionImageView: UIImageView!
    
    var counter = 0
    var photoFlag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        weAreLabel.hidden = true
        pennStateLabel.hidden = true
        chantButton.setTitle("Start!", forState: .Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chantButtonPressed(sender: UIButton) {
        // This only will be hit once - the very first chant
        if chantButton.titleLabel?.text == "Start!" {
            weAreLabel.hidden = false
            pennStateLabel.hidden = true
            chantButton.setTitle("Chant!", forState: .Normal)
            counter++
        }
        else {
            
            // If we are on the 6th chant (Thank You) - zero based counter
            if counter % 6 == 0 {
                counter++
                // even chant
                weAreLabel.hidden = false
                pennStateLabel.hidden = true
                weAreLabel.text = "Thank You"
                
            }
            //  If we are on the 7th chant (You're Welcome) - zero based counter
            else if counter % 6 == 1 && counter > 1{
                pennStateLabel.text = "You're Welcome!"
                weAreLabel.hidden = true
                pennStateLabel.hidden = false
                chantButton.setTitle("Restart", forState: .Normal)
                counter++
            }
            // If we have pressed the reset button
            else if counter == 8 {
                resetLabels()
            }
            // All WE ARE, PENN STATE chant counts (0-5)
            else {
                weAreLabel.hidden = !weAreLabel.hidden
                pennStateLabel.hidden = !pennStateLabel.hidden
                counter++
            }
            
            // swap the photo of the lion everytime
            if photoFlag {
                lionImageView.image = UIImage(named: "lion2.png")
            } else {
                lionImageView.image = UIImage(named: "lion1.png")
            }
            photoFlag = !photoFlag
        }
    }
    
    // Reset to chant again
    func resetLabels() {
        pennStateLabel.text = "Penn State"
        weAreLabel.text = "We Are"
        counter = 1
        
        pennStateLabel.hidden = true
        weAreLabel.hidden = false
        
        chantButton.setTitle("Chant", forState: .Normal)
    }
}

