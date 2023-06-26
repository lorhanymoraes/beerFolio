//
//  ServiceLocator.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

final class ServiceLocator {
    static var shared: ServiceLocator!

    var network: NetworkProtocol
    var cacheManager: CacheManager
    var userSettings: UserSettingsProtocol

    init(network: NetworkProtocol,
         cacheManager: CacheManager,
         userSettings: UserSettingsProtocol)
    {
        self.network = network
        self.cacheManager = cacheManager
        self.userSettings = userSettings
    }
}
