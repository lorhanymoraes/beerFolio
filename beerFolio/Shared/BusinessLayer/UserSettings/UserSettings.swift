//
//  UserSettings.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

protocol UserSettingsProtocol {
    var token: Dynamic<String> { get }
}

class UserSettings: UserSettingsProtocol {
    private(set) lazy var token: Dynamic<String> = {
        Dynamic<String>(try? ServiceLocator.shared.cacheManager.fetch(String.self, for: .token))
    }()
    
    func setToken(with token: String?) {
        self.token.value = token
    }
}

