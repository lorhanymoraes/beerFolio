//
//  PageCollectionViewCell.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 28/06/23.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
   lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "EDB - KDSLDSLKSLD"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
       
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
        
        self.addSubview(infoLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
            
        ])
    }
}
