//
//  PageViewModel.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 28/06/23.
//

import Foundation

import UIKit

protocol PageViewModelProtocol: AnyObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func viewDidLoad()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

final class PageViewModel: NSObject, PageViewModelProtocol {
    private let router: RouterProtocol
    
    var labels: [String] = ["ABV \n Teor Alcoólico em Volume. Representa a porcentagem de álcool presente na cerveja em relação ao volume total.", "IBU  \n Unidades Internacionais de Amargor. O IBU mede a quantidade de amargor presente na cerveja. Quanto maior o número de IBU, mais amarga será a cerveja.", "EBC \n Convenção Europeia de Cervejarias. O EBC é uma unidade de medida utilizada para determinar a cor da cerveja. Quanto maior o número de EBC, mais escura será a cerveja."]
    private var timer: Timer?
    private var currentIndex = 0

    init(router: RouterProtocol) {
        self.router = router
    }
    
    func viewDidLoad() {
    
    }
  
   }

extension PageViewModel {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageCollectionViewCell.getReuseIdentifier(), for: indexPath) as? PageCollectionViewCell else { return .init() }
        
        let indexLabel = labels[indexPath.row]
        cell.infoLabel.text = indexLabel
        
        return cell
    }
}
