//
//  ViewController.swift
//  Lesson 1. new
//
//  Created by Devins on 07.02.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    var helloLabel = UILabel()
    var calculateLabel = UILabel()
    var randomLabel = UILabel()
    private var random = String(Int.random(in: 0...5))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hiLabel
        helloLabel.frame = CGRect(x: -30, y: 100, width: 500, height: 50)
        helloLabel.textAlignment = .center
        helloLabel.text = "Hello,"
        self.view.addSubview(helloLabel)
        
        //calculateLabel
        calculateLabel.frame = CGRect(x: 2, y: 470, width: 100, height: 30)
        calculateLabel.textAlignment = .center
        self.view.addSubview(calculateLabel)
        
        //randomLabel
        randomLabel.frame = CGRect(x: 280, y: 430, width: 110, height: 110)
        randomLabel.textAlignment = .center
        self.view.addSubview(randomLabel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        alertForViewDidLoad(title: "Enter your name", message: "", style: .alert)
    }
    
    //MARK: - IBAction
    
    @IBAction private func calculateButton(_ sender: UIButton) {
        calculateButton(title: "Enter the number", message: "For calculate", style: .alert)
    }
    
    @IBAction private func randomButton(_ sender: UIButton) {
        alertForRandomButton(title: "Try to guess", message: "The number", style: .alert)
    }
    
    //MARK: - Private Method for name (ViewDidAppear)
    
    private func alertForViewDidLoad(title: String, message: String,
                                     style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            guard
                let text = alertController.textFields?.first?.text,
                var someText = self.helloLabel.text else { return }
            
            someText += text
            self.helloLabel.text = someText
        }
        
        // MARK: - Visual Components
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    //MARK: - Private Method for calculate button
    
    private func calculateButton(title: String, message: String,
                                 style: UIAlertController.Style) {
        //First text field for number
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            let firstTextField = alertController.textFields?[0]
            let secondTextField = alertController.textFields?[1]
            
            let sum = String((Int(firstTextField?.text ?? "nil") ?? 0) + (Int(secondTextField?.text ?? "nil") ?? 0))
            self.calculateLabel.text = sum
        }
        //Second text field for number
        
        let secondAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            let firstTextField = alertController.textFields?[0]
            let secondTextField = alertController.textFields?[1]
            let secondSum = String((Int(firstTextField?.text ?? "nil") ?? 0) + (Int(secondTextField?.text ?? "nil") ?? 0))
            self.calculateLabel.text = secondSum
        }
        
        // MARK: - Visual Components
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        alertController.addAction(secondAction)
        present(alertController, animated: true)
    }
    
    //MARK: - Private method for guess (Random number)
    
    private func alertForRandomButton(title: String, message: String,
                                      style: UIAlertController.Style) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let guess = UIAlertAction(title: "Random", style: .default, handler: { [self] _ in
            let number = alertController.textFields?.first
            
            if number?.text == self.random {
                randomLabel.text = "You right!"
                random = String(Int.random(in: 0...5))
            } else {
                randomLabel.text = "Wrong"
            }
        })
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(guess)
        present(alertController, animated: true)
    }
}
