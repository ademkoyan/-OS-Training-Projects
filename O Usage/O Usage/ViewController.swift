//
//  ViewController.swift
//  O Usage
//
//  Created by Adem KOYAN on 24.01.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: -DEF
    
    let kullaniciTextField: UITextField = {
        let kullanicitxt = UITextField()
        kullanicitxt.translatesAutoresizingMaskIntoConstraints = false
        kullanicitxt.placeholder = "Kullanıcı Adınızı Giriniz"
        
        return kullanicitxt
    } ()
    
    let passTextField: UITextField = {
        let passtxt = UITextField()
        passtxt.translatesAutoresizingMaskIntoConstraints = false
        passtxt.placeholder = "Şifrenizi Giriniz"
        passtxt.isSecureTextEntry = true
        
        return passtxt
    } ()
    
    let girisButon: UIButton = {
        let girisbuton = UIButton()
        girisbuton.setTitle("giriş", for: .normal)
        girisbuton.translatesAutoresizingMaskIntoConstraints = false
        
        return girisbuton
    } ()
    
    let kayitButon: UIButton = {
        let kayitbuton = UIButton()
        kayitbuton.setTitle("Kayit Ol", for: .normal)
        kayitbuton.translatesAutoresizingMaskIntoConstraints = false
        return kayitbuton
    } ()
    
    let silmeButon: UIButton = {
        let silmebuton = UIButton()
        silmebuton.setTitle("Kayıt sil", for: .normal)
        silmebuton.translatesAutoresizingMaskIntoConstraints = false
        return silmebuton
    } ()
    
    let d = UserDefaults.standard // kullanım için kurulum
    
    //MARK: LCY
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        
        
        setSubView()
    }
}

    //MARK: -EXT

extension ViewController {
    func setSubView() {
        view.addSubview(kullaniciTextField)
        view.addSubview(passTextField)
        view.addSubview(girisButon)
        view.addSubview(kayitButon)
        view.addSubview(silmeButon)
        girisButon.addTarget(self, action: #selector(girisMetod), for: .touchUpInside)
        kayitButon.addTarget(self, action: #selector(kayitMetod), for: .touchUpInside)
        silmeButon.addTarget(self, action: #selector(delUser), for: .touchUpInside)
        
        addConstraites()
    }
    
    func addConstraites() {
        kullaniciTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        kullaniciTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        kullaniciTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        kullaniciTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -650).isActive = true
        
        passTextField.topAnchor.constraint(equalTo: kullaniciTextField.bottomAnchor, constant: 5).isActive = true
        passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        passTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -600).isActive = true
        
        girisButon.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 50).isActive = true
        girisButon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        girisButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -250).isActive = true
        girisButon.widthAnchor.constraint(equalToConstant: 50 ).isActive = true
        
        kayitButon.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 50).isActive = true
        kayitButon.leadingAnchor.constraint(equalTo: girisButon.trailingAnchor, constant: 60).isActive = true
        kayitButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        kayitButon.widthAnchor.constraint(equalToConstant: 50 ).isActive = true
        
        silmeButon.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 50).isActive = true
        silmeButon.leadingAnchor.constraint(equalTo: girisButon.trailingAnchor, constant: -30).isActive = true
        silmeButon.trailingAnchor.constraint(equalTo: kayitButon.leadingAnchor, constant: 30).isActive = true
        silmeButon.widthAnchor.constraint(equalToConstant: 80 ).isActive = true
    }

    @objc func girisMetod() {
        if kullaniciTextField.text == d.string(forKey: "kAdi") && passTextField.text == d.string(forKey: "kPass") {
            goToAnasayfa()
            kullaniciTextField.text = ""
            passTextField.text = ""
        }
        else {
            let alert = UIAlertController(title: "Hata", message: "Giriş yaparken hata oluştu \n Bilgileri kontrol edin.", preferredStyle: .alert)
            let tamamButon = UIAlertAction(title: "Tamam", style: .destructive) { action in
                print("Kullanıcı Giriş yaparken hata aldı.")
            }
            alert.addAction(tamamButon)
            self.present(alert, animated: true)        }
    }
    
    func goToAnasayfa() {
        let root = AnasayfaViewController()
        let navVC = UINavigationController(rootViewController: root)
        navVC.modalPresentationStyle = .fullScreen
        
        present(navVC, animated: true)
    }
    
    @objc func kayitMetod() {
        if kullaniciTextField.text != "" && passTextField.text != "" {
            if d.string(forKey: "kAdi") == nil && d.string(forKey: "kPass") == nil {
                self.d.set(kullaniciTextField.text, forKey: "kAdi")
                self.d.set(passTextField.text, forKey: "kPass")
                kullaniciTextField.text = ""
                passTextField.text = ""
            }
            else {
                let alert = UIAlertController(title: "Hata", message: "Kayıt olurken hata oluştu \n Tekrar deneyin", preferredStyle: .alert)
                let tamamButon = UIAlertAction(title: "Tamam", style: .destructive) { action in
                    print("Kullanıcı Kayıt olurken hata aldı.")
                }
                alert.addAction(tamamButon)
                self.present(alert, animated: true)
            }
                
        }
        
    }
    
    @objc func delUser() {
        d.removeObject(forKey: "kAdi")
        d.removeObject(forKey: "kPass")
        print("Kullanıcı Bilgileri Sıfırlandı")
    }
    
    
}

