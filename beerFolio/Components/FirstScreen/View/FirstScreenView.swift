//
//  FirstScreenView.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 30/06/23.
//

import Foundation
import UIKit
import SwiftUI

protocol FirstScreenViewDelegate {
    func changeLabels()
    func startButtonTapped()
}

final class FirstScreenView: UIView {
    
    var delegate: FirstScreenViewDelegate?
    var timer: Timer?
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .init(named: "beer-initial")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var  pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.backgroundColor = .clear
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.addTarget(self, action: #selector(tappedPageControl(_:)), for: .valueChanged)
        return pageControl
    }()

    lazy var labelsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 420, height: 220)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .init(origin: self.center, size: .init(width: UIScreen.main.bounds.size.width, height: 200)), collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FirstScreenCollectionViewCell.self, forCellWithReuseIdentifier: FirstScreenCollectionViewCell.getReuseIdentifier())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isUserInteractionEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    lazy var startIcon: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(hexString: "#FDAF19")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.layer.masksToBounds = true
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        button.clipsToBounds = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "arrowshape.bounce.forward")?.withTintColor(.white)
        imageAttachment.bounds = CGRect(x: 0, y: -5, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        
        let attributedString = NSMutableAttributedString(string: "Let's Start ")
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        
        button.setAttributedTitle(attributedString, for: .normal)
        
        button.addTarget(self, action: #selector(buttonStart), for: .touchUpInside)

        return button
    }()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubview() {
        self.addSubview(backgroundImage)
        self.addSubview(labelsCollectionView)
        self.addSubview(pageControl)
        self.addSubview(startIcon)
    }

    @objc func tappedPageControl(_ sender: UIPageControl){
        labelsCollectionView.scrollToItem(at: IndexPath(row: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(scrollAutomatically), userInfo: nil, repeats: true)
    }
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        delegate?.changeLabels()
    }
    
    @objc func buttonStart() {
        delegate?.startButtonTapped()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            startIcon.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -10),
            startIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            startIcon.widthAnchor.constraint(equalToConstant: 110),
            
            labelsCollectionView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 0),
            labelsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            labelsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -20),
            labelsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            
            pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120),
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
    
        ])
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ViewPreview {
            FirstScreenView()
        }
    }
}
