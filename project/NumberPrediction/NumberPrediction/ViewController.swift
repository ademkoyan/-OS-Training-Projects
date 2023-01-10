//
//  ViewController.swift
//  NumberPrediction
//
//  Created by Adem KOYAN on 5.01.2023.
//

import UIKit

class ViewController: UIViewController {
//MARK -DEFİNATION
    let button = UIButton()
    let image = UIImageView()
    let isim = UILabel()
    
//MARK -LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
       
        view.addSubview(isim)
        isim.textColor = .systemBlue
        isim.text = "Sayı Tahimn Uygulaması"
        isim.font = UIFont.systemFont(ofSize: 30)
        isim.frame = CGRect(x: 50, y: 150, width: 350, height: 50)
        
        view.addSubview(image)
        image.image = UIImage(named: "zar")
        image.frame = CGRect(x: 150, y: 300, width: 100, height: 100)
        
        view.addSubview(button)
        button.setTitle("Oyuna Başla", for: .normal)
        button.backgroundColor = .systemPink
        button.frame = CGRect(x: 60, y: 600, width: 300, height: 50)
        button.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
        title = "Anasayfa"
       // navigationController?.navigationBar.prefersLargeTitles = true
        
    }
//MARK -FUNCTIONS
    
    @objc func didTabButton() {
        
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
        
    }

}

