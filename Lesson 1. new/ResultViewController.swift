//
//  ResultViewController.swift
//  Lesson 1. new
//
//  Created by Devins on 15.02.2022.
//

import UIKit

final class ResultViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet private var fioTextFieldResult: UILabel!
    @IBOutlet private var guestNumberTextFieldResult: UILabel!
    @IBOutlet private var tableNumberTextFieldResult: UILabel!
    
    var data = RegistrationModel()
    
    //MARK: - Public method
    
    override func viewDidLoad() {
        fioTextFieldResult.text = data.fio
        guestNumberTextFieldResult.text = data.countGuest
        tableNumberTextFieldResult.text = data.numberOfTable
    }
}

