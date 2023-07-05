//
//  TabBarController.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 04/07/23.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTabBar() {
//        let menuViewControler = MenuViewController()
//        menuViewControler.viewModel = ViewModelContainer.shared.getMenuViewModel(view: menuViewControler)
//        let configurationViewControler = ConfigurationViewController()
//        configurationViewControler.viewModel = ViewModelContainer.shared.getConfigurationViewModel(view: configurationViewControler)
        
//        self.setViewControllers([menuViewControler, configurationViewControler], animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = true
        self.tabBar.tintColor = .orange
        
        guard let items = tabBar.items else { return }
        items[0].title = "Beers"
        items[0].image = UIImage(systemName: "mug")
        
        items[1].title = "Configurations"
        items[1].image = UIImage(systemName: "gearshape")
    }
}
