//
//  ViewController.swift
//  Date and Time Picker Kullanimi
//
//  Created by Adem KOYAN on 10.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let datePickerTxt: UITextView = {
        let textView = UITextView()
        
        let attrText = NSMutableAttributedString(string: "seçilecek tarih", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        textView.attributedText = attrText
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    } ()
    
    var datePicker: UIDatePicker?
    
    let timePickerTxt: UITextView = {
        let textView = UITextView()
        
        let attrText = NSMutableAttributedString(string: "seçilecek zaman", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        textView.attributedText = attrText
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    } ()
    
    var timePicker: UIDatePicker?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World")
        view.backgroundColor = .blue
        view.addSubview(datePickerTxt)
        view.addSubview(timePickerTxt)
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePickerTxt.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(tarihGoster(datePicker:)), for:.valueChanged )
       
        let dokunmaAlgilama = UIGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmaAlgilama)
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        timePickerTxt.inputView = timePicker
        
        timePicker?.addTarget(self, action: #selector(saatGoster(timePicker:)), for: .valueChanged)
        
       
        addConstraite()
    }

    private func addConstraite() {
        
        datePickerTxt.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        datePickerTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        datePickerTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        datePickerTxt.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -700).isActive = true
        
        timePickerTxt.topAnchor.constraint(equalTo: datePickerTxt.bottomAnchor, constant: 50).isActive = true
        timePickerTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        timePickerTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        timePickerTxt.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600).isActive = true
        
        

    }
    @objc func tarihGoster(datePicker: UIDatePicker) {
        let dateFortmatter = DateFormatter()
        dateFortmatter.dateFormat = "MM/dd/yyyy"
        let alinanTarih = dateFortmatter.string(from: datePicker.date)
        
        datePickerTxt.text = alinanTarih
        /*
        view.endEditing(true)
         düzenleme bittiği gibi kapatmaya yarıyor.
         */
    }
    
    @objc func saatGoster(timePicker: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        let alinanSaat = timeFormatter.string(from: timePicker.date)
        
        timePickerTxt.text = alinanSaat
    }
    
    @objc func dokunmaAlgilamaMetod() {
        view.endEditing(true)
    }
    
    
    // abakgbowuegbowejnv
}

