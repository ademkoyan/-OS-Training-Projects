//
//  ViewController.swift
//  FirstApp
//
//  Created by Adem KOYAN on 20.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mesaj: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
      
    @IBAction func buton(_ sender: Any) {
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // main StoryBoard'a ulaşmak için
        
        let gidilecekView = storyboard.instantiateViewController(withIdentifier: "sayfa2") as! ViewController2
        // StoryBoard içindeki ilgili ViewController'a ulaştık.
        let isim = mesaj.text!
        
        let gidecekKisi = Kisiler(kisiAd: isim, kisiId: 156)
        
        gidilecekView.kisi = gidecekKisi 
        
        self.navigationController?.pushViewController(gidilecekView, animated: true)
        //self.present(gidilecekView, animated: true, completion: nil)
        // sayfa geçiş işlemini gerçekleştirdik.
        
        //MARK: 
        
    }
    
}

