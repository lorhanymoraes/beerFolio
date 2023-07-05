//
//  ViewModelContainer.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

class ViewModelContainer {
    static let shared = ViewModelContainer()

    private init() {}
    
    func getSplashScreenViewModel(view: BaseViewController) -> FakeSplashScreenViewModel {
        return .init(router: view.router)
    }
    
    func getPageControlViewModel(view: BaseViewController) -> FirstScreenViewModel {
        return .init(router: view.router)
    }
    
    func getBeersViewModel(view: BaseViewController) -> BeersScreensViewModel {
        return .init(router: view.router, services: BeersScreenService())
    }
//    
//    func getMenuViewModel(view: BaseViewController) -> MenuViewModel {
//        return .init(router: view.router)
//    }
    
}
