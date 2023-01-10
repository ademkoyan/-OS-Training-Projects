//
//  ViewController.swift
//  NavigaitonControllerTest
//
//  Created by Adem KOYAN on 26.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tapbutton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let gidilecekVC = storyboard.instantiateViewController(withIdentifier: "sayfa2") as! ViewController2
        
        self.navigationController?.pushViewController(gidilecekVC, animated: true)
        
        print("butona basıldı")
    }
    
}

