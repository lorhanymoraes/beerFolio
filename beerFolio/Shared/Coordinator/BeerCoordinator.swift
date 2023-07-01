//
//  BeerCoordinator.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import UIKit

final class BeerCoordinator {
    private var window: UIWindow?
    
    static var sceneDelegate: SceneDelegate? {
        for scene in UIApplication.shared.connectedScenes {
            if let delegate = scene.delegate as? SceneDelegate {
                return delegate
            }
        }
        return nil
    }
    
    init(window: UIWindow? = (BeerCoordinator.sceneDelegate)?.window) {
        self.window = window
    }
    
    func start() {
        let animated = window != nil
        window = window ?? UIWindow(frame: UIScreen.main.bounds)
        let viewController = FakeSplashScreenViewController()
        viewController.viewModel = ViewModelContainer.shared.getSplashScreenViewModel(view: viewController)
        let navigationController = UINavigationController(rootViewController: viewController)
        switchRootViewController(rootViewController: navigationController, animated: animated, completion: nil)
    }
    
    func changeToPageControl() {
        let animated = self.window != nil
        let viewController = FirstScreenViewController()
        viewController.viewModel = ViewModelContainer.shared.getPageControlViewModel(view: viewController)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.switchRootViewController(rootViewController: navigationController, animated: animated, completion: nil)
    }
//    
//    func changeToTabBar() {
//        let animated = self.window != nil
//        let viewController = TabBarController()
//        let navigationController = UINavigationController(rootViewController: viewController)
//        self.switchRootViewController(rootViewController: navigationController, animated: animated, completion: nil)
//    }
}

private extension BeerCoordinator {
    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if animated {
            UIView.transition(with: window!, duration: 0.5, options: .transitionCrossDissolve, animations: { [unowned self] in
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                self.window?.rootViewController = rootViewController
                self.window?.makeKeyAndVisible()
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (_: Bool) in
                completion?()
            })
        } else {
            window?.rootViewController = rootViewController
            window?.makeKeyAndVisible()
        }
    }
}
