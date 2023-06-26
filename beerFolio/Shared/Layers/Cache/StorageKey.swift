//
//  StorageKey.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

public enum StorageKey: CaseIterable {
    case token
    case userDashboardPreference

    var key: String {
        switch self {
        case .token:
            return "token"
        case .userDashboardPreference:
            return "userDashboardPreference"
        }
    }
}
