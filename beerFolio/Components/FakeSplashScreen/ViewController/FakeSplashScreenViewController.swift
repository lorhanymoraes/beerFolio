//
//  FakeSplashScreenViewController.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import UIKit

final class FakeSplashScreenViewController: BaseViewController {
    // MARK: - Class properties

    var viewModel: FakeSplashScreenViewModelProtocol?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = FakeSplashScreenView()
    }
}
