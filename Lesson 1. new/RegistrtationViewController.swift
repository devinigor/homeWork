//
//  RegistrtationViewController.swift
//  Lesson 1. new
//
//  Created by Devins on 15.02.2022.
//

import UIKit

final class RegistrationViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet private var fioTextField: UITextField!
    @IBOutlet private var guestNumberTextField: UITextField!
    @IBOutlet private var tableNumberTextField: UITextField!
    
    private var registrationModel = RegistrationModel()
    
    //MARK: - Private method (Alert)
    
    private func alertTitle(title: String = "", message: String = "", style: UIAlertController.Style = .alert) {
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let action = UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            self.setData()
            self.goToResultViewController()
        })
        
        alertMessage.addAction(action)
        alertMessage.addAction(cancel)
        present(alertMessage, animated: true)
    }
    
    private func setData() {
        registrationModel.fio = fioTextField.text ?? "nil"
        registrationModel.countGuest = guestNumberTextField.text ?? "nil"
        registrationModel.numberOfTable = guestNumberTextField.text ?? "nil"
    }
    
    private func goToResultViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
        viewController.data = registrationModel
        present(viewController, animated: true)
    }
    
    //MARK: - Action button
    
    @IBAction func buildTapped(_ sender: UIButton) {
        alertTitle(title: "Выставить счет?")
    }
}
