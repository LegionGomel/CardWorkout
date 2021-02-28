//
//  CardSelectionVC.swift
//  CardWorkout-SeanAllen
//
//  Created by Yuri Ershov on 16.02.21.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    // Outlet to all buttons, for simple visual appearance
    @IBOutlet var buttons: [UIButton]!
    
    var timer: Timer!
    var cards: [UIImage] = Deck.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsCornerRadius()
        startTimer()
        
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    /// Define corner radius to all main screen buttons
    func buttonsCornerRadius() {
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    /// Starts timer that shows random card with interval
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    /**
     Function that shows random image from card deck
     # Notes: #
     1. Default element is "AS
    */
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // When show rules screen, stop timer
        timer.invalidate()
    }
}

