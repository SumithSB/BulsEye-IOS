//
//  ViewController.swift
//  BullsEye
//
//  Created by Sumith on 11/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue : Int = 50
    var targetValue : Int = 0
    var score = 0
    var round = 0

    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roundedNumber = sliderValue.value.rounded()
        currentValue = Int(roundedNumber)
        startNewRound()
        
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        sliderValue.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        sliderValue.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        
        let trackResizableLeft = trackLeftImage.resizableImage(withCapInsets: insets)
        sliderValue.setMinimumTrackImage(trackResizableLeft, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        
        let trackResizableRight = trackRightImage.resizableImage(withCapInsets: insets)
        sliderValue.setMinimumTrackImage(trackResizableRight, for: .normal)
        // Do any additional setup after loading the view.
    }

    @IBAction func hitMeOnPressed(_ sender: Any) {
        
        
        let difference = abs(targetValue - currentValue)
        
        var points = 100 - difference
        
        let title: String
        
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference < 5{
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        }else if difference < 10{
            title = "Pretty good!"
        }else{
            title = "Not even close.."
        }
        
        score += points
        
        let message =  "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            ACTION in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        

    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        
        let roundedNumber = slider.value.rounded()
        currentValue = Int(roundedNumber)
        
    }
    
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        sliderValue.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundsLabel.text = String(round)
    }
    

    
    @IBAction func startOver(_ sender: Any) {
        score = 0
        round = 0
        startNewRound()
    }
}

