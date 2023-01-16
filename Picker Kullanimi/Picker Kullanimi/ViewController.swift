//
//  ViewController.swift
//  Picker Kullanimi
//
//  Created by Adem KOYAN on 10.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let datePickerTxt: UITextView = {
        let textView = UITextView()
        
        let attrText = NSMutableAttributedString(string: "Bişiyler bişiyler", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        textView.attributedText = attrText
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    } ()
    
    var datePicker: UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World")
        view.backgroundColor = .blue
        view.addSubview(datePickerTxt)
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePickerTxt.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(tarihGoster(datePicker:)), for:.valueChanged )
       
        let dokunmaAlgilama = UIGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod)){
            view.gestureRecognizers(dokunmaAlgilama())
        }
       
        addConstraite()
    }

    private func addConstraite() {
        
        datePickerTxt.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        datePickerTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        datePickerTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        datePickerTxt.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true

    }
    @objc func tarihGoster(datePicker: UIDatePicker) {
        let dateFortmatter = DateFormatter()
        dateFortmatter.dateFormat = "MM/dd/yyyy"
        let alinanTarih = dateFortmatter.string(from: datePicker.date)
        
        datePickerTxt.text = alinanTarih
        
        view.endEditing(true)
    }
    
    @objc func dokunmaAlgilamametod() {
        view.endEditing(true)
    }
    
}

