//
//  BaseViewController.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import UIKit

public class BaseViewController: UIViewController {
    let router: RouterProtocol = Router()
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        router.presentedView = self
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        router.presentedView = self
    }
}
