//
//  AllBeersEndpoint.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Moya

enum AllBeersEndpoint {
    case getAllBeers
}

// MARK: - Endpoint Builder

extension AllBeersEndpoint: Endpoint {

    var path: String {
        switch self {
        case .getAllBeers:
            return "beers"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getAllBeers:
            return .get
        }
    }

    private var parameters: [String: Any] {
        switch self {
        case .getAllBeers:
            return [:]
        }
    }

    private var encoding: ParameterEncoding {
        switch method {
        case .put:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }

    var task: Task {
        .requestParameters(parameters: parameters, encoding: encoding)
    }
}
