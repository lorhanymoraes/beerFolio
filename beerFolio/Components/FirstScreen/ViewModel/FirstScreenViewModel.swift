//
//  FirstScreenViewModel.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 30/06/23.
//

import Foundation
import UIKit

protocol FirstScreenViewModelProtocol: AnyObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func viewDidLoad()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    var labels: [String] { get set }

}

final class FirstScreenViewModel: NSObject, FirstScreenViewModelProtocol {
    private let router: RouterProtocol
    
     var labels: [String] = ["ABV \n Teor Alcoólico em Volume. Representa a porcentagem de álcool presente na cerveja em relação ao volume total.", "IBU  \n Unidades Internacionais de Amargor. O IBU mede a quantidade de amargor presente na cerveja. Quanto maior o número de IBU, mais amarga será a cerveja.", "EBC \n Convenção Europeia de Cervejarias. O EBC é uma unidade de medida utilizada para determinar a cor da cerveja. Quanto maior o número de EBC, mais escura será a cerveja."]
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func viewDidLoad() {
    }
}

extension FirstScreenViewModel {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstScreenCollectionViewCell.getReuseIdentifier(), for: indexPath) as? FirstScreenCollectionViewCell else { return .init() }
        let indexLabel = labels[indexPath.row]
        cell.infoLabel.text = indexLabel
        
        return cell
    }
}
