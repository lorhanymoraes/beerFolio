//
//  AppEnvionment.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

enum AppEnvironment {
    static var websiteURL: String {
        return "https://api.punkapi.com/v2/"
    }

    static var baseURL: String {
        return "https://api.punkapi.com/v2/"
    }

    static var bundleId: String {
        return "com.projects.lorhanymoraes.beerFolio"
    }

    static var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "0"
    }

    static var appBuildVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "0"
    }
}
