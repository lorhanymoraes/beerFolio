//
//  Endpoint.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Moya

public protocol Endpoint: TargetType {
    var requiresLogin: Bool { get }
}

extension Endpoint {
    public var baseURL: URL {
        let url = AppEnvironment.baseURL
        return URL(string: url)!
    }

    var userToken: String? {
        return ServiceLocator.shared.userSettings.token.value
    }

    var requiresLogin: Bool {
        return true
    }

    var headers: [String: String]? {
        let jsonHeaderValue = "application/json"

        var headers = [
            "Content-type": jsonHeaderValue,
            "Connection": "keep-alive",
            "Accept": jsonHeaderValue
        ]

        if let userToken = userToken, requiresLogin {
            headers["Authorization"] = "Bearer \(userToken)"
        }

        return headers
    }

    public var validationType: ValidationType {
        .successAndRedirectCodes
    }

    var timeoutInterval: TimeInterval {
        return 60
    }

    var sampleData: Data { Data() }
}
