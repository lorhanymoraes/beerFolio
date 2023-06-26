//
//  AppRepository.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

final class AppRepository {
    static let shared = AppRepository()

    func refreshToken(onSuccess _: @escaping (Result<String, OrionError>) -> Void) {
        let network = MoyaManager()
//        network.request(UserAuthenticationEndpoint.getToken(code: ""), expectedType: UserResponse.self, onSuccess)
    }
}
