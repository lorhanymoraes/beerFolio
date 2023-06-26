//
//  Router.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import UIKit

final class Router: RouterProtocol {
    weak var presentedView: BaseViewController?

    func present(view: BaseViewController) {
        presentedView?.present(view, animated: true, completion: nil)
    }

    func present(view: UIViewController) {
        presentedView?.present(view, animated: true, completion: nil)
    }

    func dismiss() {
        presentedView?.dismiss(animated: true, completion: nil)
    }

    func dismiss(_ completion: @escaping (() -> Void)) {
        presentedView?.dismiss(animated: true, completion: completion)
    }

    func pop() {
        _ = presentedView?.navigationController?.popViewController(animated: true)
    }

    func popToRoot() {
        _ = presentedView?.navigationController?.popToRootViewController(animated: true)
    }

    func popTo(vc: BaseViewController) {
        _ = presentedView?.navigationController?.popToViewController(vc, animated: true)
    }

    func push(view: BaseViewController) {
        presentedView?.navigationController?.pushViewController(view, animated: true)
    }


    func showAlert(title: String, message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        for action in actions {
            alert.addAction(action)
        }

        guard let presentedView = presentedView else { return }
        presentedView.present(alert, animated: true)
    }
}
