//
//  BeerError.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

public struct OrionError: Error, Codable {
    var statusCode: Int?
    var message: String?
}
