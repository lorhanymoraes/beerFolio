//
//  AllBeersEndpoint.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Moya

enum AllBeersEndpoint {
    case authenticate(user: String, password: String, empID: String)
}

// MARK: - Endpoint Builder

extension AllBeersEndpoint: Endpoint {

    var path: String {
        switch self {
        case .authenticate:
            return "/Posseidom/Sistema/DPSistemas.WS/v1/api.asmx/AutenticarJSON"
        }
    }

    var method: Moya.Method {
        switch self {
        case .authenticate:
            return .post
        }
    }

    var requiresLogin: Bool {
        return false
    }
    
    var headers: [String : String]? {
        switch self {
        case .authenticate:
            return [
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        }
    }

    private var parameters: [String: Any] {
        switch self {
        case let .authenticate(user, password, empID):
            return [
                "Nome": user,
                "Senha": password,
                "Emp_ID": empID
            ]
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
