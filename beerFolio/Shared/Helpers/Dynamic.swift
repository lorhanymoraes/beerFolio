//
//  Dynamic.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

public typealias Callback<T> = (_: T) -> Void

import Foundation

/// Lightweight Observable Pattern
public class Dynamic<T> {
    private var bindings: [Callback<T>] = []

    public var value: T? {
        didSet {
            update()
        }
    }

    public init(_ v: T?) {
        value = v
    }

    public func update() {
        guard let value = value else { return }
        bindings.forEach {
            $0(value)
        }
    }

    func subscribe(_ binding: @escaping Callback<T>) {
        bindings.append(binding)
    }
}
