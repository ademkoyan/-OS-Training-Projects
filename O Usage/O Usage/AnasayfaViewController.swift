//
//  AnasayfaViewController.swift
//  O Usage
//
//  Created by Adem KOYAN on 25.01.2023.
//

import UIKit

class AnasayfaViewController: UIViewController {

    //MARK: -DEF
    let dosyaTextView: UITextField = {
        let dosyatxt = UITextField()
        dosyatxt.translatesAutoresizingMaskIntoConstraints = false
        dosyatxt.placeholder = "metin giriniz"
        
        return dosyatxt
    } ()
    
    let yazButon: UIButton = {
        let yazbuton = UIButton()
        yazbuton.setTitle("Yaz", for: .normal)
        yazbuton.translatesAutoresizingMaskIntoConstraints = false
        
        return yazbuton
    } ()
    
    let okuButon: UIButton = {
        let okubuton = UIButton()
        okubuton.setTitle("Oku", for: .normal)
        okubuton.translatesAutoresizingMaskIntoConstraints = false
        return okubuton
    } ()
    
    let silButon: UIButton = {
        let silbuton = UIButton()
        silbuton.setTitle("sil", for: .normal)
        silbuton.translatesAutoresizingMaskIntoConstraints = false
        return silbuton
    } ()
    
    let rkayitButon: UIButton = {
        let rkayitbuton = UIButton()
        rkayitbuton.setTitle("Resim Kaydet", for: .normal)
        rkayitbuton.translatesAutoresizingMaskIntoConstraints = false
        
        return rkayitbuton
    } ()
    
    let rgosterButon: UIButton = {
        let rgosterbuton = UIButton()
        rgosterbuton.setTitle("Resim Göster", for: .normal)
        rgosterbuton.translatesAutoresizingMaskIntoConstraints = false
        return rgosterbuton
    } ()
    
    let rsilButon: UIButton = {
        let rsilbuton = UIButton()
        rsilbuton.setTitle("Resim Sil", for: .normal)
        rsilbuton.translatesAutoresizingMaskIntoConstraints = false
        return rsilbuton
    } ()
    
    //MARK: -LCY
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Anasayfa"
        view.backgroundColor = .red

        setSubviews()
    }

}
    //MARK: - EXT
extension AnasayfaViewController {
    func setSubviews(){
        view.addSubview(dosyaTextView)
        view.addSubview(yazButon)
        view.addSubview(okuButon)
        view.addSubview(silButon)
        view.addSubview(rkayitButon)
        view.addSubview(rgosterButon)
        view.addSubview(rsilButon)
        yazButon.addTarget(self, action: #selector(yazMetod), for: .touchUpInside)
        okuButon.addTarget(self, action: #selector(okuMetod), for: .touchUpInside)
        silButon.addTarget(self, action: #selector(silMetod), for: .touchUpInside)
        rkayitButon.addTarget(self, action: #selector(rkayitMetod), for: .touchUpInside)
        rgosterButon.addTarget(self, action: #selector(rgosterMetod), for: .touchUpInside)
        rsilButon.addTarget(self, action: #selector(rsilMetod), for: .touchUpInside)
        
        addConstraites()
    }
    
    func addConstraites() {
        
        dosyaTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        dosyaTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        dosyaTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        dosyaTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -650).isActive = true
        //dosyaTextView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        yazButon.topAnchor.constraint(equalTo: dosyaTextView.bottomAnchor, constant: 20).isActive = true
        yazButon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        yazButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -250).isActive = true
        yazButon.widthAnchor.constraint(equalToConstant: 50 ).isActive = true
        
        okuButon.topAnchor.constraint(equalTo: dosyaTextView.bottomAnchor, constant: 20).isActive = true
        okuButon.leadingAnchor.constraint(equalTo: yazButon.trailingAnchor, constant: -30).isActive = true
        okuButon.trailingAnchor.constraint(equalTo: silButon.leadingAnchor, constant: 30).isActive = true
        okuButon.widthAnchor.constraint(equalToConstant: 80 ).isActive = true
        
        silButon.topAnchor.constraint(equalTo: dosyaTextView.bottomAnchor, constant: 20).isActive = true
        silButon.leadingAnchor.constraint(equalTo: okuButon.trailingAnchor, constant: 60).isActive = true
        silButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        silButon.widthAnchor.constraint(equalToConstant: 50 ).isActive = true
        
        rkayitButon.topAnchor.constraint(equalTo: yazButon.bottomAnchor, constant: 20).isActive = true
        rkayitButon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        rkayitButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -250).isActive = true
        rkayitButon.widthAnchor.constraint(equalToConstant: 50 ).isActive = true
        
        rgosterButon.topAnchor.constraint(equalTo: okuButon.bottomAnchor, constant: 20).isActive = true
        rgosterButon.leadingAnchor.constraint(equalTo: rkayitButon.trailingAnchor, constant: -30).isActive = true
        rgosterButon.trailingAnchor.constraint(equalTo: rsilButon.leadingAnchor, constant: 30).isActive = true
        rgosterButon.widthAnchor.constraint(equalToConstant: 80 ).isActive = true
        
        rsilButon.topAnchor.constraint(equalTo: silButon.bottomAnchor, constant: 20).isActive = true
        rsilButon.leadingAnchor.constraint(equalTo: rgosterButon.trailingAnchor, constant: 60).isActive = true
        rsilButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        rsilButon.widthAnchor.constraint(equalToConstant: 50 ).isActive = true
    }
    
    @objc func yazMetod() {
        let mesaj = dosyaTextView.text
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathExtension("dosyam.txt")
            
            do {
                try mesaj?.write(to: dosyaYolu, atomically: false, encoding: String.Encoding.utf8)
                dosyaTextView.text = ""
            }
            catch {
                let alert = UIAlertController(title: "Hata", message: "Dosya yazılırken hata oluştu \n Tekrar deneyin", preferredStyle: .alert)
                let tamamButon = UIAlertAction(title: "Tamam", style: .destructive) { action in
                    print("Dosya yazılırken hata oluştu.")
                }
                alert.addAction(tamamButon)
                self.present(alert, animated: true)
            }
        }
    }
    @objc func okuMetod() {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathExtension("dosyam.txt")
            
            do {
                dosyaTextView.text = try String(contentsOf: dosyaYolu, encoding: String.Encoding.utf8)
            }
            catch {
                let alert = UIAlertController(title: "Hata", message: "Dosya okunurken hata oluştu \n Tekrar deneyin", preferredStyle: .alert)
                let tamamButon = UIAlertAction(title: "Tamam", style: .destructive) { action in
                    print("Dosya okunurken hata oluştu.")
                }
                alert.addAction(tamamButon)
                self.present(alert, animated: true)
            }
        }
        
    }
    @objc func silMetod() {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathExtension("dosyam.txt")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path) {
                do {
                    try FileManager.default.removeItem(at: dosyaYolu)
                    dosyaTextView.text = ""
                }
                catch {
                    let alert = UIAlertController(title: "Hata", message: "Dosya silinirken hata oluştu \n Tekrar deneyin", preferredStyle: .alert)
                    let tamamButon = UIAlertAction(title: "Tamam", style: .destructive) { action in
                        print("Dosya silinirken hata oluştu.")
                    }
                    alert.addAction(tamamButon)
                    self.present(alert, animated: true)
                }
            }
        }
        
    }
    @objc func rkayitMetod() {
        
    }
    @objc func rgosterMetod() {
        
    }
    @objc func rsilMetod() {
        
    }
}
