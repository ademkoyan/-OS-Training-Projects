//
//  ViewController.swift
//  Basic TableView
//
//  Created by Adem KOYAN on 21.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        configureTableView()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //setl row height
        tableView.rowHeight = 100
        // register cell
        // set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}

