//
//  StorageError.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

public enum StorageError: Error {
    case notFound
    case cantWrite(Error)
    case cantDelete(StorageKey)
}
