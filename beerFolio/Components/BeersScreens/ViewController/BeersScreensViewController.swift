//
//  BeersScreensViewController.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 04/07/23.
//

import Foundation
import UIKit
import UIKit

final class BeersScreensViewController: BaseViewController{
    
    // MARK: - Class properties
    var viewModel: BeersScreensViewModelProtocol?
    private var viewInstance: BeersScreensView?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInstance?.delegate = self
        setupCollectionView()
        bindUI()
        viewModel?.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        viewInstance = BeersScreensView()
        view = viewInstance
    }
    
    func setupCollectionView() {
        viewInstance?.popularMoviesCollectionView.delegate = self
        viewInstance?.popularMoviesCollectionView.dataSource = self
        viewInstance?.popularMoviesCollectionView.reloadData()
    }
    
    func bindUI() {
       
    }
}

extension BeersScreensViewController: BeersScreensViewDelegate {
  
}

extension BeersScreensViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.collectionView(collectionView, numberOfItemsInSection: section) ?? .init()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return viewModel?.collectionView(collectionView, cellForItemAt: indexPath) ?? .init()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}

