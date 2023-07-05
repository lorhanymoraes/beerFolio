//
//  FirstScreenViewController.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 30/06/23.
//

import Foundation
import UIKit

final class FirstScreenViewController: BaseViewController {
    
    // MARK: - Class properties
    var viewModel: FirstScreenViewModelProtocol?
    private var viewInstance: FirstScreenView?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInstance?.delegate = self
        setupCollectionView()
        bindUI()
        viewModel?.viewDidLoad()
        viewInstance?.startTimer()
    }
    
    override func loadView() {
        super.loadView()
        viewInstance = FirstScreenView()
        view = viewInstance
    }
    
    func setupCollectionView() {
        viewInstance?.labelsCollectionView.delegate = self
        viewInstance?.labelsCollectionView.dataSource = self
        viewInstance?.labelsCollectionView.reloadData()
    }
    
    func bindUI() {
        
    }
}

extension FirstScreenViewController: FirstScreenViewDelegate {
    func startButtonTapped() {
        BeerCoordinator().changeToTabBar()
    }
    
    func changeLabels() {
        guard let visibleCell = viewInstance?.labelsCollectionView.visibleCells else { return }
        for cell in visibleCell {
            if viewModel?.labels.count == 1 {
                return
            }
            let indexPath = viewInstance?.labelsCollectionView.indexPath(for: cell)
            if indexPath?.row ?? 0 < ((viewModel?.labels.count ?? 1) - 1) {
                let indexPath1 = IndexPath.init(row: (indexPath?.row ?? 0) + 1, section: indexPath?.section ?? 0)
                viewInstance?.labelsCollectionView.scrollToItem(at: indexPath1, at: .right, animated: true)
                viewInstance?.pageControl.currentPage = indexPath1.row
            }
            else {
                let indexPath1 = IndexPath.init(row: 0, section: indexPath?.section ?? 0)
                viewInstance?.labelsCollectionView.scrollToItem(at: indexPath1, at: .left, animated: true)
                viewInstance?.pageControl.currentPage = indexPath1.row
            }
        }
    }
}

extension FirstScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
