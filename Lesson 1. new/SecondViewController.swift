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
    
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    let instagramLabel = UILabel()
    let imageView = UIImageView()
    let dayToBirthday = UILabel()
    let navBarBirthday = UINavigationItem()
    let buttonPlus = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nameLabel
        nameLabel.frame = CGRect(x: 50, y: 300, width: 60, height: 30)
        nameLabel.text = ""
        nameLabel.tintColor = .systemGray
        self.view.addSubview(nameLabel)
        
        //ageLabel
        ageLabel.frame = CGRect(x: 50, y: 400, width: 70, height: 30)
        ageLabel.text = ""
        ageLabel.tintColor = .systemGray
        self.view.addSubview(ageLabel)
        
        //dayToBirthday
        dayToBirthday.text = ""
        dayToBirthday.tintColor = .systemGray
        
        //instagramLabel
        instagramLabel.text = ""
        
        //imageView
        imageView.image = UIImage()
        imageView.tintColor = .lightGray
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        self.view.addSubview(imageView)
        
        //BarButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addTapped))
        
            
    }
    
    //func for BarButton
    @objc private func addTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let viewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController")
         navigationController?.pushViewController(viewController, animated: true)
    }
    
    //func for pass data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ThirdViewController else { return }
        destination.delegate = self
    }
    
    func update(name: String, age: String, instagram: String, image: UIImage,
                dayTo: Date) {
        nameLabel.text = name.capitalized
        ageLabel.text? = age + " " + "years"
        instagramLabel.text = instagram
        imageView.image = image
        
        let fromDay = dayTo
        let diffInDsays = Calendar.current.dateComponents([.day], from: .now, to: fromDay).day
        dayToBirthday.text! = diffInDsays!.description + " " + "дней"
    }
    
}
