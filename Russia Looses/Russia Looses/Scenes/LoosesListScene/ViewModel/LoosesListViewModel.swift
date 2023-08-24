//
//  LoosesListViewModel.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 23.08.2023.
//

import UIKit

class LoosesListViewModel: LoosesListViewModelProtocol {
    
    @Injected(\.dataService) var dataService
    var coordinatorDelegate: LoosesListViewModelCoordinatorDelegate?
    
    func reduceTotalLoses() -> [String: Int] {
        var total : [String : Int] = [:]
        if let lastDayEquipment = dataService.equipmentLooses.max(by: { $0.day ?? 0 < $1.day ?? 0 }),
            let lastDayPersonnel = dataService.personnelLooses.first(where: { $0.day == lastDayEquipment.day }) {
            total["Aircraft"] = lastDayEquipment.aircraft ?? 0
            total["Helicopter"] = lastDayEquipment.helicopter ?? 0
            total["Tank"] = lastDayEquipment.tank ?? 0
            total["APC"] = lastDayEquipment.apc ?? 0
            total["Field artillery"] = lastDayEquipment.fieldArtillery ?? 0
            total["MRL"] = lastDayEquipment.mrl ?? 0
            total["Special equipment"] = lastDayEquipment.specialEquipment ?? 0
            total["Vehicles and fuel tanks"] = lastDayEquipment.vehiclesAndFuelTanks ?? 0
            total["Drone"] = lastDayEquipment.drone ?? 0
            total["Naval ship"] = lastDayEquipment.navalShip ?? 0
            total["Anti-aircraft warfare"] = lastDayEquipment.antiAircraftWarfare ?? 0
            total["Cruise missiles"] = lastDayEquipment.cruiseMissiles ?? 0
            total["Personnel"] = lastDayPersonnel.personnel
        }
        return total
    }
    
    func openDetailController(_ sender: (String, String)) {
        coordinatorDelegate?.openDetailControllerDelegate(sender)
    }
    
}

protocol LoosesListViewModelCoordinatorDelegate: AnyObject {
    func openDetailControllerDelegate(_ sender: (String, String))
}
