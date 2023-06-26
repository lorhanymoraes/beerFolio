//
//  RouterProtocol.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import UIKit.UIViewController

typealias AlertAction = (title: String, style: UIAlertAction.Style, action: () -> Void)

protocol RouterProtocol: AnyObject {
    var presentedView: BaseViewController? { get set }
    func present(view: BaseViewController)
    func dismiss()
    func dismiss(_ completion: @escaping (() -> Void))
    func pop()
    func popToRoot()
    func popTo(vc: BaseViewController)
    func push(view: BaseViewController)
    func showAlert(title: String, message: String, actions: [UIAlertAction])
}
