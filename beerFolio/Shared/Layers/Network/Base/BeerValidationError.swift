//
//  BeerValidationError.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

public enum OrionValidationError: LocalizedError {
    case somethingWentWrong

    var localizedDescription: String {
        switch self {
        case .somethingWentWrong:
            return "Algo de errado aconteceu!"
        }
    }
}
