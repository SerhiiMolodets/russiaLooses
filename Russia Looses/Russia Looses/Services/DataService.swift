//
//  DataService.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 23.08.2023.
//

import Foundation

class DataService: DataServiceProtocol {
    
    var personnelLooses: [Personnel] = []
    var equipmentLooses: [Equipment] = []
    
    func getEquipmentLooses() {
        equipmentLooses = Bundle.main.decode(file: "russia_losses_equipment.json")
    }
    
    func getPersonnelLooses() {
        personnelLooses = Bundle.main.decode(file: "russia_losses_personnel.json")
    }
    
    init() {
        getEquipmentLooses()
        getPersonnelLooses()
    }
}
