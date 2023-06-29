//
//  FakeSplashScreenViewModel.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//


import UIKit

protocol FakeSplashScreenViewModelProtocol: AnyObject {
    func viewDidLoad()
}

final class FakeSplashScreenViewModel: NSObject, FakeSplashScreenViewModelProtocol {
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func viewDidLoad() {
        BeerCoordinator().changeToPageControl()
//        if ServiceLocator.shared.userSettings.token.value != nil {
//            OrionCoordinator().changeToTabBar()
//        } else {
//            OrionCoordinator().changeToLogin()
//        }
    }
}
