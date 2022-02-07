//
//  ViewController.swift
//  Lesson 1. new
//
//  Created by Devins on 07.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        alertForStart(title: "Enter your name", message: "", style: .alert)
        self.hiLabel.text = "Hello, "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var calculateLabel: UILabel!
    @IBOutlet weak var randomLabel: UILabel!
    
    
    @IBAction func calculate(_ sender: Any) {
        self.alertButton(title: "Enter the number", message: "For calculate", style: .alert)
    }
    
    @IBAction func randomNumber(_ sender: Any) {
        self.guessButton(title: "Try to guess", message: "The number", style: .alert)
    }
    
    func alertForStart(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let text = alertController.textFields?.first?.text
            self.hiLabel.text! += text!
        }
            alertController.addTextField(configurationHandler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
    }
    
    
    func alertButton(title: String, message: String, style: UIAlertController.Style) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let firstTextField = alertController.textFields?[0]
            let secondTextField = alertController.textFields?[1]
            let sum = String((Int((firstTextField?.text)!) ?? 0) + (Int((secondTextField?.text)!) ?? 0))
            self.calculateLabel?.text! = sum
        }
        
        let secondAction = UIAlertAction(title: "Cancel", style: .cancel) { (secondAction) in
            let firstTextField = alertController.textFields?[0]
            let secondTextField = alertController.textFields?[1]
            let secondSum = String((Int((firstTextField?.text)!) ?? 0) + (Int((secondTextField?.text)!) ?? 0))
            self.calculateLabel?.text! = secondSum
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        alertController.addAction(secondAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - GUESS
    
    var random = String(Int.random(in: 0...5))
    
    func guessButton(title: String, message: String, style: UIAlertController.Style) {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let guess = UIAlertAction.init(title: "Random", style: .default, handler: { [self] (action) in
            let number = alertController.textFields?.first
            
            if number?.text! == self.random {
                self.randomLabel?.text! = "You right!"
                self.random = String(Int.random(in: 0...5))
            } else {
                self.randomLabel?.text! = "Wrong"
            }
        })
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(guess)
        self.present(alertController, animated: true, completion: nil)
    }
}

