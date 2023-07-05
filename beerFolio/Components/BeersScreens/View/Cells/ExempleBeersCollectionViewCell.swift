//
//  ExempleBeersCollectionViewCell.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 04/07/23.
//

import Foundation
import UIKit

class ExempleBeersCollectionViewCell: UICollectionViewCell {
    
    private lazy var menuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        view.backgroundColor =  .gray
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [ .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        view.clipsToBounds = false
        return view
    }()
    
    private lazy var menuImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .init(systemName: "newspaper")
        imageView.tintColor = .gray

        return imageView
    }()

  lazy var menuTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = .white
        self.addSubview(menuView)
        self.addSubview(menuImage)
        self.addSubview(menuTitle)
        setupConstraints()
    }
    
//    func setupCell(with title: String?) {
//        menuTitle.text = title
//        if title == "Financeiro - Resumo" {
//            menuImage.image = .init(systemName: "newspaper")
//        } else {
//            menuImage.image = .init(systemName: "centsign.circle")
//        }
//    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            menuView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2),
            menuView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 2),
            menuView.widthAnchor.constraint(equalToConstant: 150),
            menuView.heightAnchor.constraint(equalToConstant: 100),
            
            menuImage.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 20),
            menuImage.heightAnchor.constraint(equalToConstant: 20),
            menuImage.centerXAnchor.constraint(equalTo: menuView.centerXAnchor, constant: 0),
            
            menuTitle.topAnchor.constraint(equalTo: menuImage.bottomAnchor, constant: 10),
            menuTitle.widthAnchor.constraint(equalToConstant: 100),
            menuTitle.centerXAnchor.constraint(equalTo: menuView.centerXAnchor, constant: 0),
            
        ])
    }
}
