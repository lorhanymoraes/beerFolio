//
//  BeersScreensView.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 04/07/23.
//

import Foundation
import UIKit
import SwiftUI

protocol BeersScreensViewDelegate {
 
}


final class BeersScreensView: UIView {
    
    var delegate: BeersScreensViewDelegate?
    
    private lazy var navigationBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
//    private lazy var menuIcon: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = .init(named: "menu_icon")
//        return imageView
//    }()
    
    private lazy var navigationBarTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BeerFolio"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
//    private lazy var notificationIcon: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = .init(named: "notification_icon")
//        return imageView
//    }()
    
    private lazy var popularMoviesTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BeerFolio"
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        return label
    }()
    
    private lazy var popularMoviesSeeMoreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See more", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        button.setTitleColor(.gray, for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var popularMoviesCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        layout.itemSize = CGSize(width: 143, height: 283)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .init(origin: self.center, size: .init(width: UIScreen.main.bounds.size.width, height: 285)), collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ExempleBeersCollectionViewCell.self, forCellWithReuseIdentifier: ExempleBeersCollectionViewCell.getReuseIdentifier())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    lazy var nowMoviesTableView: UITableView = {
//        let nowTableView = UITableView(frame: .init(origin: self.center, size: .init(width: UIScreen.main.bounds.size.width, height: 200)))
//        nowTableView.translatesAutoresizingMaskIntoConstraints = false
//        nowTableView.rowHeight = 140
//        nowTableView.register(NowShowingTableViewCell.self, forCellReuseIdentifier: NowShowingTableViewCell.reuseIdentifier)
//        return nowTableView
//    }()
    
    
    private func configure() {
        self.backgroundColor = .white
        self.addSubview(navigationBar)
//        self.navigationBar.addSubview(menuIcon)
        self.navigationBar.addSubview(navigationBarTitle)
//        self.navigationBar.addSubview(notificationIcon)
        self.addSubview(popularMoviesTitle)
        self.addSubview(popularMoviesSeeMoreButton)
        self.addSubview(popularMoviesCollectionView)
//        self.addSubview(nowMoviesTableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 44),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 60),
            
//            menuIcon.heightAnchor.constraint(equalToConstant: 30),
//            menuIcon.widthAnchor.constraint(equalToConstant: 30),
//            menuIcon.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 24),
//            menuIcon.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 18),
//
            navigationBarTitle.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 18),
            navigationBarTitle.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor),
            
//            notificationIcon.heightAnchor.constraint(equalToConstant: 30),
//            notificationIcon.widthAnchor.constraint(equalToConstant: 30),
//            notificationIcon.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -24),
//            notificationIcon.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 18),
            
            popularMoviesTitle.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 14),
            popularMoviesTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            popularMoviesSeeMoreButton.centerYAnchor.constraint(equalTo: popularMoviesTitle.centerYAnchor),
            popularMoviesSeeMoreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            popularMoviesSeeMoreButton.widthAnchor.constraint(equalToConstant: 100),
            
            popularMoviesCollectionView.topAnchor.constraint(equalTo: popularMoviesTitle.bottomAnchor, constant: 16),
            popularMoviesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            popularMoviesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            popularMoviesCollectionView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}

struct BeersScreensView_Previews: PreviewProvider {
    static var previews: some View {
        ViewPreview {
            BeersScreensView()
        }
    }
}
