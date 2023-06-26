//
//  CacheManager.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

public final class CacheManager {
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    private lazy var userDefaultsStorage = UserDefaultsStorage()

    init(decoder: JSONDecoder = .init(),
         encoder: JSONEncoder = .init())
    {
        self.decoder = decoder
        self.encoder = encoder
    }

    func fetch<T: Codable>(_: T.Type, for key: StorageKey) throws -> T {
        return try getSuitableStorage().fetchValue(for: key)
    }

    func save<T: Codable>(_ value: T, for key: StorageKey) throws {
        try getSuitableStorage().save(value: value, for: key)
    }

    func remove<T: Codable>(type: T.Type, for key: StorageKey) throws {
        try getSuitableStorage().remove(type: type, for: key)
    }
}

private extension CacheManager {
    func getSuitableStorage() -> Storage {
        return userDefaultsStorage
    }
}
