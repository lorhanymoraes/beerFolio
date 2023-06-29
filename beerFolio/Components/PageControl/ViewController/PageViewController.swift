//
//  PageViewController.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 28/06/23.
//

import UIKit

final class PageViewController: BaseViewController {
    
    // MARK: - Class properties
    var viewModel: PageViewModelProtocol?
    private var viewInstance: PageControlView?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInstance?.delegate = self
        bindUI()
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isHidden = true
        setupCollectionView()
        viewModel?.viewDidLoad()
        
    }
    
    override func loadView() {
        super.loadView()
        viewInstance = PageControlView()
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

extension PageViewController: PageControlViewDelegate {

}

extension PageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return viewInstance?.labels.count ?? 1
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCollectionViewCell.getReuseIdentifier(), for: indexPath) as? PageCollectionViewCell else { return .init() }
          
            let indexLabel = viewInstance?.labels[indexPath.row]
            cell.infoLabel.text = indexLabel
            
            return cell
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: viewInstance?.labelsCollectionView.contentOffset ?? .init(), size: viewInstance?.labelsCollectionView.bounds.size ?? .init())
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visiblePath = viewInstance?.labelsCollectionView.indexPathForItem(at: visiblePoint)
        viewInstance?.pageControl.currentPage = visiblePath?.row ?? 1
    }
    }
