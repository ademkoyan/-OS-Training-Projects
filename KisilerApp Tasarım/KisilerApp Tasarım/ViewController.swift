//
//  ViewController.swift
//  KisilerApp Tasarım
//
//  Created by Adem KOYAN on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -DEF
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    
    //MARK: -LC
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
       
        setTableView()
        configureNavBar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setTableView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureNavBar() {
        navigationItem.title = "Kişiler"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addPerson))
    }
    
    @objc func addPerson() {
        let vc = KisiEkleViewController()
        navigationController?.pushViewController(vc, animated: true)
    }


}
    //MARK: -EXT
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    
}
