//
//  DetailViewModel.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 24.08.2023.
//

import Foundation

class DetailViewModel: DetailViewModelProtocol {
    var currentLooses: (String, String)?
    @Injected(\.dataService) var dataService
    
    func getHistoryList() -> [DetailModel] {
        guard let currentLooses else { fatalError("Empty looses error") }
        switch currentLooses.0 {
        case "Personnel" : return dataService.personnelLooses.map { DetailModel(date: $0.date, count: String($0.personnel)) }
        case "APC": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.apc ?? 0)) }
        case "Aircraft": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.aircraft ?? 0)) }
        case "Anti-aircraft warfare": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.antiAircraftWarfare ?? 0)) }
        case "Cruise missiles": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.cruiseMissiles ?? 0)) }
        case "Drone": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.drone ?? 0)) }
        case "Field artillery": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.fieldArtillery ?? 0)) }
        case "Helicopter": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.helicopter ?? 0)) }
        case "MRL": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.mrl ?? 0)) }
        case "Naval ship": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.navalShip ?? 0)) }
        case "Special equipment": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.specialEquipment ?? 0)) }
        case "Tank": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.tank ?? 0)) }
        case "Vehicles and fuel tanks": return dataService.equipmentLooses.map { DetailModel(date: $0.date, count: String($0.vehiclesAndFuelTanks ?? 0)) }
        default: return []
        }
    }
}
