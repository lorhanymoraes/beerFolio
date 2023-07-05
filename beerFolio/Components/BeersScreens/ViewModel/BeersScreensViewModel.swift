//
//  BeersScreensViewModel.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 04/07/23.
//

import Foundation
import UIKit

protocol BeersScreensViewModelProtocol: AnyObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func viewDidLoad()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell

}

final class BeersScreensViewModel: NSObject, BeersScreensViewModelProtocol {
    private let router: RouterProtocol
    private let services: BeersScreenServiceProtocol
    
    private var options: [String] = ["Financeiro - Resumo", "Financeiro - Resultado"]
   
    init(router: RouterProtocol, services: BeersScreenServiceProtocol) {
        self.router = router
        self.services = services
    }
    
    func viewDidLoad() {
    }
    
}

extension BeersScreensViewModel {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExempleBeersCollectionViewCell.getReuseIdentifier(), for: indexPath) as? ExempleBeersCollectionViewCell else { return .init() }
//        cell.setupCell(with: options[indexPath.row])
        
        return cell
    }
}


