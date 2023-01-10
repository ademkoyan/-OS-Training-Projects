//
//  SecondViewController.swift
//  NumberPrediction
//
//  Created by Adem KOYAN on 5.01.2023.
//

import UIKit

class SecondViewController: UIViewController {
    //MARK: -DEFINATIONS
    var hak:Int = 5
    var randomSayi2:Int?
    let kalanHak = UILabel()
    let yonlendirme = UILabel()
    let tahminSayi = UITextField()
    let tahminEt = UIButton()
    
    //MARK: -LIFECYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SecondViewController"
        view.backgroundColor = .green
        
        kalanHak.text = "Kalan Hak: \(hak)"
        view.addSubview(kalanHak)
        kalanHak.font = UIFont.systemFont(ofSize: 20)
        kalanHak.textColor = .gray
        kalanHak.frame = CGRect(x: 150, y: 100, width: 200, height: 50)
        
        view.addSubview(yonlendirme)
        yonlendirme.font = UIFont.systemFont(ofSize: 70)
        yonlendirme.frame = CGRect(x: 100, y: 250, width: 300, height: 100)
        yonlendirme.text = "kwhbefk"
        
        view.addSubview(tahminSayi)
        tahminSayi.placeholder = "Tahmin sayınızı giriniz"
        tahminSayi.frame = CGRect(x: 120, y: 400, width: 200, height: 100)
        
        
        view.addSubview(tahminEt)
        navigationController?.navigationBar.backgroundColor = .white
        tahminEt.setTitle("Tahmin et", for: .normal)
        tahminEt.backgroundColor = .gray
        tahminEt.frame = CGRect(x: 150, y: 600, width: 100, height:60 )
        tahminEt.addTarget(self, action: #selector(tahmin), for: .touchUpInside)
    }

    //MARK: -FUNCTIONS
    @objc func tahmin() {
        if let veri = tahminSayi.text{
            if let tahminRakam = Int(veri) {
                
            }
        }
           
    }
        
}
