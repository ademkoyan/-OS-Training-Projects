//
//  ViewController2.swift
//  FirstApp
//
//  Created by Adem KOYAN on 21.12.2022.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var mesaj: UILabel!
    var mesaj1: Kisiler?
    var kisi: Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mesaj.text = kisi?.kisiAd
        

        // Do any additional setup after loading the view.
    }
    @IBAction func buton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let gidilecekView = storyBoard.instantiateViewController(withIdentifier: "sayfa1") as! ViewController
        
        self.dismiss(animated: true)
    }
}
