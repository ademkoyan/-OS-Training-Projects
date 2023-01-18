//
//  ViewController.swift
//  Pickerview Kullanımı
//
//  Created by Adem KOYAN on 18.01.2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let pickerLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "ksbfgkqv"
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
        } ()
    
    let pickerview: UIPickerView = {
        let pickerview = UIPickerView()
        
        pickerview.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerview
    } ()
    
    var ulkeler: [String] = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(pickerLabel)
        
        view.addSubview(pickerview)
        pickerview.delegate = self
        pickerview.dataSource = self
        
        addConntraite()
        
        
        ulkeler = ["Türkiye", "almanya", "gürcistan", "norveç", "finlandiya"]
        
        view.addGestureRecognizer(dokunmaAlgılama)
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerLabel.text = ulkeler[row]
    }
    
    let dokunmaAlgılama = UIGestureRecognizer(target: ViewController.self, action: #selector(dokunmaMetod))
    
    @objc func dokunmaMetod() {
        view.endEditing(true)
    }
    

    private func addConntraite() {
        pickerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        pickerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        pickerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        pickerLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -700).isActive = true
        
        pickerview.topAnchor.constraint(equalTo: pickerLabel.bottomAnchor, constant: 30).isActive = true
        pickerview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        pickerview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        pickerview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        
     
    }
    
    

}

