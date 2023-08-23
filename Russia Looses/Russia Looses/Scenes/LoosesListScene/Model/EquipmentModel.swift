//
//  EquipmentModel.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 23.08.2023.
//

import Foundation

struct Equipment: Codable {
    let date: String
    let day, aircraft, helicopter, tank: Int?
    let apc, fieldArtillery, mrl, militaryAuto: Int?
    let fuelTank, drone, navalShip, antiAircraftWarfare: Int?
    let specialEquipment, vehiclesAndFuelTanks, cruiseMissiles: Int?
    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
}
