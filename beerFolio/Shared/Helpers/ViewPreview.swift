//
//  ViewPreview.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import SwiftUI

struct ViewPreview: UIViewRepresentable {
    let viewBuilder: () -> UIView

    init(_ viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }

    func makeUIView(context _: Context) -> some UIView {
        viewBuilder()
    }

    func updateUIView(_: UIViewType, context _: Context) {
        // Not needed
    }
}

struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerBuilder: () -> UIViewController

    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }

    func makeUIViewController(context _: Context) -> some UIViewController {
        return viewControllerBuilder()
    }

    func updateUIViewController(_: UIViewControllerType, context _: Context) {
        // Not needed
    }
}
