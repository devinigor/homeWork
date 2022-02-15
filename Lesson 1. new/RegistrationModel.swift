//
//  RegistrationModel.swift
//  Lesson 1. new
//
//  Created by Devins on 15.02.2022.
//

import UIKit

struct RegistrationModel {
    
    var fio: String
    var countGuest: String
    var numberOfTable: String
    
    init(fio: String = "", countGuest: String = "", numberOfTable: String = "") {
        self.fio = fio
        self.countGuest = countGuest
        self.numberOfTable = numberOfTable
    }
}
