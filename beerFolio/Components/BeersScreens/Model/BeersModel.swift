//
//  BeersModel.swift
//  beerFolio
//
//  Created by Lorhany Moraes on 04/07/23.
//

import Foundation

struct BeersModel: Codable {
    let id: Int
    let name: String
//    let tagline: String
//    let firstBrewed: String
//    let description: String
//    let imageUrl: String
//    let abv: Double
//    let ibu: Double
//    let targetFg: Double
//    let targetOg: Double
//    let ebc: Double
//    let srm: Double
//    let ph: Double
//    let attenuationLevel: Double
//    let volume: Volume
//    let boilVolume: Volume
//    let method: Method
//    let ingredients: Ingredients
//    let foodPairing: [String]
//    let brewersTips: String
//    let contributedBy: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, tagline, description, abv, ibu, ebc, srm, ph
//        , volume, method, ingredients, foodPairing, brewersTips, contributedBy
//        case firstBrewed = "first_brewed"
//        case imageUrl = "image_url"
//        case targetFg = "target_fg"
//        case targetOg = "target_og"
//        case attenuationLevel = "attenuation_level"
//        case boilVolume = "boil_volume"
//    }
}

struct Volume: Codable {
    let value: Int
    let unit: String
}

struct Method: Codable {
    let mashTemp: [MashTemp]
    let fermentation: Fermentation
    let twist: String?
}

struct MashTemp: Codable {
    let temp: Temperature
    let duration: Int
}

struct Fermentation: Codable {
    let temp: Temperature
}

struct Temperature: Codable {
    let value: Double
    let unit: String
}

struct Ingredients: Codable {
    let malt: [Malt]
    let hops: [Hop]
    let yeast: String
}

struct Malt: Codable {
    let name: String
    let amount: Volume
}

struct Hop: Codable {
    let name: String
    let amount: Volume
    let add: String
    let attribute: String
}
