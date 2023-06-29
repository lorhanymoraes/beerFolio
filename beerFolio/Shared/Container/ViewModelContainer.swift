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
    
    func getPageControlViewModel(view: BaseViewController) -> PageViewModel {
        return .init(router: view.router)
    }
    
//    func getLoginViewModel(view: BaseViewController) -> LoginViewModel {
//        return .init(router: view.router, services: LoginServices())
//    }
//    
//    func getMenuViewModel(view: BaseViewController) -> MenuViewModel {
//        return .init(router: view.router)
//    }
    
}
