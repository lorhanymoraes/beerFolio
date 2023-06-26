//
//  AppEnvionment.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 26/06/23.
//

import Foundation

enum AppEnvironment {
    static var websiteURL: String {
        return "http://dploja.posseidom.com:8484"
    }

    static var baseURL: String {
//#if TEST
//        return "http://192.168.9.111"
//#elseif TEST
//        return "http://dploja.posseidom.com:8484"
//#else
        return "http://dploja.posseidom.com:8484"
//#endif
        
    }

    static var bundleId: String {
        return "com.dpsistemas.Orion"
    }

    static var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "0"
    }

    static var appBuildVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "0"
    }
}
