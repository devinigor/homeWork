//
//  ThirdViewController.swift
//  Lesson 1. new
//
//  Created by Devins on 17.02.2022.
//

import UIKit
import PhotosUI
import Photos

class ThirdViewController: UIViewController, PHPickerViewControllerDelegate {
    
    weak var delegate: SecondViewControllerDelegate?
    
    private let imageFoto = UIImageView()
    
    private let labelName = UILabel()
    private let textFieldName = UITextField()
    
    private let labelDate = UILabel()
    private let textFieldDate = UITextField()
    
    private let labelAge = UILabel()
    private let textFieldAge = UITextField()
    
    private let labelSex = UILabel()
    private let textFieldSex = UITextField()
    
    private let labelInstagram = UILabel()
    private let textFieldInstagram = UITextField()
    
    private var datePicker = UIDatePicker()
    private let agePicker = UIPickerView()
    private let sexPicker = UIPickerView()
    
    private let addButton = UIButton()
    private let addPhotoButton = UIButton()
    
    private let sex = ["Мужской", "Женский"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Visual
        
        //Name (Label & TextField)
        labelName.frame = CGRect(x: 30, y: 220, width: 80, height: 30)
        labelName.text = "Имя"
        labelName.textColor = .blue
        view.addSubview(labelName)
        textFieldName.frame = CGRect(x: 30, y: 250, width: 300, height: 30)
        textFieldName.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(textFieldName)
        
        //Date (Label & TextField)
        labelDate.frame = CGRect(x: 30, y: 320, width: 60, height: 30)
        labelDate.text = "Дата"
        labelDate.textColor = .blue
        view.addSubview(labelDate)
        textFieldDate.frame = CGRect(x: 30, y: 350, width: 300, height: 30)
        textFieldDate.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(textFieldDate)
        
        //Age (Label & TextField)
        labelAge.frame = CGRect(x: 30, y: 420, width: 80, height: 30)
        labelAge.text = "Возраст"
        labelAge.textColor = .blue
        view.addSubview(labelAge)
        textFieldAge.frame = CGRect(x: 30, y: 450, width: 300, height: 30)
        textFieldAge.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(textFieldAge)
        
        //Sex (Label & TextField)
        labelSex.frame = CGRect(x: 30, y: 520, width: 40, height: 30)
        labelSex.text = "Пол"
        labelSex.textColor = .blue
        view.addSubview(labelSex)
        textFieldSex.frame = CGRect(x: 30, y: 550, width: 300, height: 30)
        textFieldSex.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(textFieldSex)
        
        //Instagram (Label & TextField)
        labelInstagram.frame = CGRect(x: 30, y: 620, width: 80, height: 40)
        labelInstagram.text = "Instagram"
        labelInstagram.textColor = .blue
        view.addSubview(labelInstagram)
        textFieldInstagram.frame = CGRect(x: 30, y: 650, width: 300, height: 30)
        textFieldInstagram.borderStyle = UITextField.BorderStyle.roundedRect
        view.addSubview(textFieldInstagram)
        
        //Image Foto
        imageFoto.frame = CGRect(x: 150, y: 120, width: 120, height: 120)
        imageFoto.image = UIImage(systemName: "person.circle")
        imageFoto.tintColor = .lightGray
        imageFoto.layer.cornerRadius = imageFoto.frame.size.width / 2
        view.addSubview(imageFoto)
        
        //AddPhotoButton
        addPhotoButton.frame = CGRect(x: 140, y: 50, width: 120, height: 80)
        addPhotoButton.setTitle("Change photo", for: .normal)
        addPhotoButton.setTitleColor(.blue, for: .normal)
        addPhotoButton.addTarget(self, action: #selector(changePhoto), for: .touchUpInside)
        view.addSubview(addPhotoButton)
        
        createDatePicker()
        datePicker.locale = .init(identifier: "Russian")
        datePicker.preferredDatePickerStyle = .wheels
       
        createPicker()
        
        agePicker.dataSource = self
        agePicker.delegate = self
        agePicker.tag = 1
        textFieldAge.inputView = agePicker
        
        sexPicker.dataSource = self
        sexPicker.delegate = self
        sexPicker.tag = 2
        textFieldSex.inputView = sexPicker
        
        textFieldInstagram.addTarget(self, action: #selector(alertInstagram), for: .allEditingEvents)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(funcForAddButton))
    }
    
    //MARK: - Func for Instagram
    
    @objc private func alertInstagram() {
        let alertInstagram = UIAlertController(title: "Enter username", message: "", preferredStyle: .alert)
        alertInstagram.addTextField { (field) in
            field.placeholder = "@"
        }
        
        alertInstagram.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
        }))
        
        alertInstagram.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            let inst = alertInstagram.textFields?.first
            
            self.textFieldInstagram.text! += (inst?.text) ?? "nil"
        }))
        present(alertInstagram, animated: true, completion: nil)
    }
    
    @objc private func changePhoto() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = PHPickerFilter.images
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
    
    //func for AddButton
    @objc private func funcForAddButton() {
        delegate?.update(name: textFieldName.text ?? "nil", age: textFieldAge.text ?? "nil", instagram: textFieldInstagram.text ?? "nil", image: imageFoto.image!, dayTo: datePicker.date)
        //dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Data Picker
    private func createDatePicker() {
        
        let toolbarPicker = UIToolbar()
        toolbarPicker.sizeToFit()
        
        let doneButtonToolbar = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(pressedDoneBtn))
        toolbarPicker.setItems([doneButtonToolbar], animated: true)
        
        textFieldDate.inputAccessoryView = toolbarPicker
        textFieldDate.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc private func pressedDoneBtn() {
        
        let formted = DateFormatter()
        formted.dateStyle = .long
        formted.timeZone = .none
    
        // Date in russian lenguage
        formted.locale = .init(identifier: "Russian")
        
        textFieldDate.text = formted.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    //MARK: - Create Done button for picker
    private func createPicker() {
        
        let toolbarPicker = UIToolbar()
        toolbarPicker.sizeToFit()
        
        let doneButtonToolbar = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtomAge))
        toolbarPicker.setItems([doneButtonToolbar], animated: true)

        textFieldAge.inputAccessoryView = toolbarPicker
        textFieldSex.inputAccessoryView = toolbarPicker
    }
    
    @objc private func doneButtomAge() {
        view.endEditing(true)
    }
}
    //MARK: - Picker Age/Sex

extension ThirdViewController: UIPickerViewDataSource {
    
    //количество компонентов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //содержимое компонентов
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return 100
        case 2:
            return sex.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return "\(row)"
        case 2:
            return sex[row]
        default:
            return "Data not found "
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            textFieldAge.text = "\(row)"
        case 2:
            textFieldSex.text = sex[row]
        default:
            return
        }
    }
}

extension ThirdViewController: UIPickerViewDelegate {
    //MARK: - Func for picker
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        results.forEach { results in
            results.itemProvider.loadObject(ofClass: UIImage.self) { [weak self]
                reading, error in
                DispatchQueue.main.sync {
                guard let image = reading as? UIImage, error == nil else { return }
                    self?.imageFoto.image = image
                }
            }
        }
    }
}
