//
//  FakeSplashScreenView.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import SwiftUI
import UIKit

final class FakeSplashScreenView: UIView {
    // MARK: - Class properties

    // MARK: - UI

    private lazy var splashScreenImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .init(named: "beer-initial")
        image.contentMode = .center
        return image
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubview() {
        self.backgroundColor = .white
        self.addSubview(splashScreenImageView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            splashScreenImageView.topAnchor.constraint(equalTo: topAnchor),
            splashScreenImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            splashScreenImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            splashScreenImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

struct FakeSplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ViewPreview {
            FakeSplashScreenView()
        }
    }
}
