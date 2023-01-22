//
//  ViewController.swift
//  Basic TableView
//
//  Created by Adem KOYAN on 21.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var datas: [Data] = []
    struct Cells {
        static let customCell = "CustomCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        configureTableView()
        
        datas = fetchData()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //setl row height
        tableView.rowHeight = 100
        // register cell
        tableView.register(CustomCellTableViewCell.self, forCellReuseIdentifier: Cells.customCell)
        // set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.customCell) as! CustomCellTableViewCell
        let data = datas[indexPath.row]
        cell.set(data: data)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = datas[indexPath.row].title
        print("\(indexPath.row+1). sırada ki \(name), verisi seçildi")
    }
    
    func fetchData() -> [Data] {
        let data1 = Data(image: images.zar!, title:"zar")
        let data2 = Data(image: images.askeriPilot!, title:"askeriPilot")
        let data3 = Data(image: images.soloTurk!, title:"SoloTurk")
        
        return [data1, data2, data3]
    }
    
}

