//
//  Model.swift
//  Lesson 1. new
//
//  Created by Devins on 16.02.2022.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func update(name: String, age: String, instagram: String, image: UIImage, dayTo: Date)
}

class SecondViewController: UIViewController, SecondViewControllerDelegate {
    
    //MARK: - Label's
    
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let instagramLabel = UILabel()
    private let imageView = UIImageView()
    private let dayToBirthday = UILabel()
    private let navBarBirthday = UINavigationItem()
    private let buttonPlus = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nameLabel
        nameLabel.frame = CGRect(x: 50, y: 300, width: 160, height: 30)
        nameLabel.text = String()
        nameLabel.tintColor = .systemGray
        view.addSubview(nameLabel)
        
        //ageLabel
        ageLabel.frame = CGRect(x: 50, y: 350, width: 170, height: 30)
        ageLabel.text = String()
        ageLabel.tintColor = .systemGray
        view.addSubview(ageLabel)
        
        //dayToBirthday
        dayToBirthday.frame = CGRect(x: 50, y: 400, width: 170, height: 30)
        dayToBirthday.text = String()
        dayToBirthday.tintColor = .systemGray
        view.addSubview(dayToBirthday)
        
        //instagramLabel
        instagramLabel.frame = CGRect(x: 50, y: 440, width: 170, height: 30)
        instagramLabel.text = String()
        instagramLabel.tintColor = .systemGray
        view.addSubview(instagramLabel)
        
        //imageView
        imageView.frame = CGRect(x: 150, y: 120, width: 120, height: 120)
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .systemGray
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.isHidden = true
        view.addSubview(imageView)
        
        //BarButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    //func for BarButton
    @objc private func addTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
        viewController?.delegate = self
         navigationController?.pushViewController(viewController!, animated: true)
        imageView.isHidden = false
    }
    
    func update(name: String, age: String, instagram: String, image: UIImage, dayTo: Date) {
        nameLabel.text? = name.capitalized
        ageLabel.text? = age + " " + "years"
        instagramLabel.text? = instagram
        imageView.image? = image
        let fromDay = dayTo
        let diffInDsays = Calendar.current.dateComponents([.day], from: .now, to: fromDay).day
        if (diffInDsays?.description) != nil {
            dayToBirthday.text = diffInDsays!.description + " " + "дней"
        }
    }
}
