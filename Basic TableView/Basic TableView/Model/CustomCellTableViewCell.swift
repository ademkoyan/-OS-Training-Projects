//
//  CustomCellTableViewCell.swift
//  Basic TableView
//
//  Created by Adem KOYAN on 22.01.2023.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    
    var dataImageView = UIImageView()
    var titleView = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dataImageView)
        addSubview(titleView)
        
        configureImageView()
        configureTitleView()
        setImageConstraites()
        setTitleConstraites()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(data: Data){
        dataImageView.image = data.image
        titleView.text = data.title
    }
    
    func configureImageView() {
        dataImageView.layer.cornerRadius = 10
        dataImageView.clipsToBounds = true
    }
    
    func configureTitleView() {
        titleView.numberOfLines = 0
        titleView.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraites() {
        dataImageView.translatesAutoresizingMaskIntoConstraints = false
        dataImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dataImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dataImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        dataImageView.widthAnchor.constraint(equalTo: dataImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleConstraites() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleView.leadingAnchor.constraint(equalTo: dataImageView.trailingAnchor, constant: 20).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    
    }
    
    
}
