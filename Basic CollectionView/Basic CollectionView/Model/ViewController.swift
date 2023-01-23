//
//  ViewController.swift
//  Basic CollectionView
//
//  Created by Adem KOYAN on 23.01.2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -DEF
    
    var myCollectionView: UICollectionView?

    //MARK: -LCY
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = .green
        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        
        view.addSubview(myCollectionView ?? UICollectionView())
        
    }
}

    //MARK: -FUNC

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9 // How many cells to display
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row+1)")
    }

}


 
    
