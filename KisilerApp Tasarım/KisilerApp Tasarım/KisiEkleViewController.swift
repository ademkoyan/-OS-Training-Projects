//
//  KisiEkleViewController.swift
//  KisilerApp Tasarım
//
//  Created by Adem KOYAN on 14.03.2023.
//

import UIKit

class KisiEkleViewController: UIViewController {

    //MARK: -DEF
    private let kisiAdi: UITextField = {
        let isimField = UITextField()
        isimField.translatesAutoresizingMaskIntoConstraints = false
        isimField.placeholder = "Kişi Adı"
        isimField.borderStyle = .roundedRect
        return isimField
    }()
    
    private let kisiTel: UITextField = {
        let telField = UITextField()
        telField.translatesAutoresizingMaskIntoConstraints = false
        telField.placeholder = "Kişi Tel"
        telField.borderStyle = .roundedRect
        return telField
    }()
    
    private let kayitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Kaydet", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: -LC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Kişi Ekle"
        
        setSubviews()
    }

}

    //MARK: -EXT
extension KisiEkleViewController {
     private func setSubviews() {
        view.addSubview(kayitButton)
         kayitButton.addTarget(self, action: #selector(KayitMetod), for: .touchUpInside)
        view.addSubview(kisiAdi)
        view.addSubview(kisiTel)
        
        addConstraite()
    }
    
    @objc func KayitMetod() {
        print("butona basıldı")
    }
    
    private func addConstraite() {
        let kisiAdiFieldConstraite = [
            kisiAdi.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            kisiAdi.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            kisiAdi.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            kisiAdi.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600)
        ]
        
        let kisiTelFieldConstraite = [
            kisiTel.topAnchor.constraint(equalTo: kisiAdi.bottomAnchor, constant: 75),
            kisiTel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            kisiTel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            kisiTel.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let kayitButonConstraite = [
            kayitButton.topAnchor.constraint(equalTo: kisiTel.bottomAnchor, constant: 75),
            kayitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            kayitButton.heightAnchor.constraint(equalToConstant: 50),
            kayitButton.widthAnchor.constraint(equalToConstant: 100)
            
        ]
         
        
        NSLayoutConstraint.activate(kisiAdiFieldConstraite)
        NSLayoutConstraint.activate(kisiTelFieldConstraite)
        NSLayoutConstraint.activate(kayitButonConstraite)
    }
}
