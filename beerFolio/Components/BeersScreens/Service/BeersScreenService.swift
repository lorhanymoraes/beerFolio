//
//  BeersScreenService.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 04/07/23.
//

import Foundation

protocol BeersScreenServiceProtocol {
    func getAllBeers(onSuccess: @escaping (Result<BeersModel, OrionError>) -> Void)
}

final class BeersScreenService: BeersScreenServiceProtocol {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol = MoyaManager()) {
        self.network = network
    }
    func getAllBeers(onSuccess: @escaping (Result<BeersModel, OrionError>) -> Void) {
        network.request(AllBeersEndpoint.getAllBeers, expectedType: BeersModel.self, onSuccess)
    }
}
