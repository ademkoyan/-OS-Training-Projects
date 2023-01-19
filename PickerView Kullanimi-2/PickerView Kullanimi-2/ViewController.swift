//
//  ViewController.swift
//  PickerView Kullanimi-2
//
//  Created by Adem KOYAN on 19.01.2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: -DEF
    let pickerTextView: UITextView = {
        let pickerTextView = UITextView()
        
        let attrText = NSMutableAttributedString(string: "Ülke Seçimi Yapınız", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
                pickerTextView.attributedText = attrText
       
        pickerTextView.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerTextView
    } ()
    
    let pickerView: UIPickerView = {
       
        let pickerView = UIPickerView()
        return pickerView
    } ()
    
    struct ulkeler {
        let ulke: String?
        let sehir: [String]?
        
        init(ulke: String, sehir: [String]){
            self.sehir = sehir
            self.ulke = ulke
        }
    }
    
    var veriler = [ulkeler]()
    
    let toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.tintColor = .red
        toolBar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(tamamMetod))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptalButton = UIBarButtonItem(title: "İptal", style: .plain, target: self, action: #selector(iptalMetod))
        
        toolBar.setItems([iptalButton, spaceButton, tamamButton], animated: true)
        
        return toolBar
    } ()
    
    
    //MARK: - LİFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(pickerTextView)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerTextView.inputView = pickerView
        pickerTextView.inputAccessoryView = toolBar
        
        veriler.append(ulkeler(ulke: "Türkiye", sehir: ["istanbul", "ankaran", "bursa", "izmir"]))
        veriler.append(ulkeler(ulke: "almanya", sehir: ["berlin", "dortmund", "stutgard"]))
        veriler.append(ulkeler(ulke: "amerika", sehir: ["nyc", "dc", "texas", "la"]))
        
        
        
    }

    //MARK: -FUNC
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return veriler.count
        }
        else {
            let secilenUlke = pickerView.selectedRow(inComponent: 0)
            return veriler[secilenUlke].sehir!.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return veriler[row].ulke
        }
        else {
            let secilenUlke = pickerView.selectedRow(inComponent: 0)
            return veriler[secilenUlke].sehir![row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let secilenUlke = pickerView.selectedRow(inComponent: 0)
        let secilenSehir = pickerView.selectedRow(inComponent: 1)
        let ulke = veriler[secilenUlke].ulke
        let sehir = veriler[secilenSehir].sehir
        pickerTextView.text = "Seçilen ülke \(ulke) /nSeçilen Sehir \(sehir)"
    }
    
    
    private func addConstraite() {
     pickerTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
     pickerTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
     pickerTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
     pickerTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500).isActive = true
     
    }
    
    @objc func tamamMetod() {
        print("Seçim tamamlandı")
    }
    
    @objc func iptalMetod() {
        print("SEÇİM İPTAL EDİLDİ")
        pickerTextView.text = ""
        view.endEditing(true)
    }
}

