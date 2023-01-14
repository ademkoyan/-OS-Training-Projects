//
//  ViewController.swift
//  Picker Kullanimi
//
//  Created by Adem KOYAN on 10.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let datePicker: UITextView = {
        let textView = UITextView()
        
        let attrText = NSMutableAttributedString(string: "Bişiyler bişiyler", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        textView.attributedText = attrText
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World")
        view.backgroundColor = .blue
        view.addSubview(datePicker)
       
        addConstraite()
    }

    private func addConstraite() {
        
        datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true

    }
}

