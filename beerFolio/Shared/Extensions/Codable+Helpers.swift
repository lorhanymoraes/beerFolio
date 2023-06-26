//
//  Codable+Helpers.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        let serialized = (try? JSONSerialization.jsonObject(with: encode(), options: .allowFragments))
        return serialized as? [String: Any] ?? [String: Any]()
    }

    func encode() -> Data {
        return (try? JSONEncoder().encode(self)) ?? Data()
    }
}

extension Data {
    func asDictionary() -> [String: Any] {
        let serialized = try? JSONSerialization.jsonObject(with: self, options: [])
        return serialized as? [String: Any] ?? [:]
    }

    func decode<T: Codable>(_: T.Type) -> T? {
        do {
            return (try JSONDecoder().decode(T.self, from: self))
        } catch {
            debugPrint(error)
            return nil
        }
    }
}
