//
//  NetworkProtocol.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

public protocol NetworkProtocol {
    func request<T: Codable, U: Endpoint>(_ endpoint: U, expectedType: T.Type, _ onResponse: @escaping (Result<T, OrionError>) -> Void)
}
