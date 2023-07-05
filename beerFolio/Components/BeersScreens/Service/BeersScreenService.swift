//
//  BeersScreenService.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 04/07/23.
//

import Foundation

protocol BeersScreenServiceProtocol {
//    func getAuthorizations(onSuccess: @escaping (Result<AuthorizationModel, OrionError>) -> Void)
}

final class BeersScreenService: BeersScreenServiceProtocol {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol = MoyaManager()) {
        self.network = network
    }
    
//    func getAuthorizations(onSuccess: @escaping (Result<AuthorizationModel, OrionError>) -> Void) {
//        network.request(AuthorizationEndpoint.getAuthorizations, expectedType: AuthorizationModel.self, onSuccess)
//    }
}
