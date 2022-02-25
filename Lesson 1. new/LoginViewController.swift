//
//  ViewController.swift
//  Lesson 1. new
//
//  Created by Devins on 07.02.2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let labelReminder = UILabel()
    private let signLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let faceIdLabel = UILabel()
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let borderLinePassword = CALayer()
    private let buttonTogglePassword = UIButton()
    private let eyeButton = UIButton()
    private let enterButton = UIButton()
    private let faceIdSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Label's
        
        //labelReminder
        labelReminder.frame = CGRect(x: 110, y: 50, width: 200, height: 100)
        labelReminder.text = "Birthday Reminder"
        labelReminder.textAlignment = .center
        labelReminder.font = UIFont.boldSystemFont(ofSize: 20)
        labelReminder.shadowColor = .lightGray
        labelReminder.layer.borderWidth = 1.0
        view.addSubview(labelReminder)
        
        //signLabel
        signLabel.frame = CGRect(x: 10, y: 250, width: 100, height: 100)
        signLabel.text = "Sign In"
        signLabel.textAlignment = .center
        signLabel.font = UIFont.boldSystemFont(ofSize: 20)
        signLabel.shadowColor = .lightGray
        view.addSubview(signLabel)
        
        //email label
        emailLabel.frame = CGRect(x: 20, y: 320, width: 60, height: 60)
        emailLabel.text = "Email"
        emailLabel.textAlignment = .center
        emailLabel.font = UIFont.boldSystemFont(ofSize: 15)
        emailLabel.textColor = .blue
        view.addSubview(emailLabel)
        
        //password label
        passwordLabel.frame = CGRect(x: 25, y: 400, width: 80, height: 60)
        passwordLabel.textAlignment = .center
        passwordLabel.text = "Password"
        passwordLabel.textColor = .blue
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 15)
        view.addSubview(passwordLabel)
        
        //faceid label
        faceIdLabel.frame = CGRect(x: 175, y: 535, width: 150, height: 20)
        faceIdLabel.text = "Вход по Face ID"
        view.addSubview(faceIdLabel)
        
        //switch faceid
        faceIdSwitch.frame = CGRect(x: 310, y: 530, width: 150, height: 20)
        faceIdSwitch.isOn = true
        view.addSubview(faceIdSwitch)
        
        //MARK: - TextFields's
        
        //email textfield
        emailTextField.frame = CGRect(x: 30, y: 370, width: 250, height: 20)
        emailTextField.borderStyle = UITextField.BorderStyle.roundedRect
        emailTextField.placeholder = "Email"
        view.addSubview(emailTextField)
        
        //password textfield
        passwordTextField.frame = CGRect(x: 30, y: 450, width: 250, height: 20)
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        view.addSubview(passwordTextField)
        
        //MARK: - Button's
        
        //enter button
        enterButton.frame = CGRect(x: 130, y: 600, width: 150, height: 40)
        enterButton.layer.borderWidth = 1.0
        enterButton.setTitle("Войти", for: .normal)
        enterButton.setTitleColor(UIColor.white, for: .normal)
        enterButton.backgroundColor = .blue
        enterButton.layer.cornerRadius = 5
        enterButton.addTarget(self, action: #selector(actionForEnterButton), for: .touchUpInside)
        view.addSubview(enterButton)
    
        //eyeButton
        eyeButton.frame = CGRect(x: 260, y: 450, width: 20, height: 20)
        eyeButton.setBackgroundImage(UIImage(systemName: "eye"), for: UIControl.State.normal)
        eyeButton.tintColor = .lightGray
        eyeButton.setBackgroundImage(UIImage(systemName: "eye"), for: UIControl.State.normal)
        eyeButton.addTarget(self, action: #selector(eyeFunc), for: .touchUpInside)
        view.addSubview(eyeButton)
    }
        //MARK: - Method for enterButton
    
    @objc private func actionForEnterButton() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
        //MARK: - Method for eyeButton
    
    @objc private func eyeFunc() {
        if passwordTextField.isSecureTextEntry == false {
            eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        } else {
            passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
}

