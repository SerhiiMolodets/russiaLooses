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
        guard let equipmentURL = Bundle.main.url(forResource: "russia_losses_equipment", withExtension: "json"),
              let equipmentData = try? Data(contentsOf: equipmentURL) else { return }
        do {
            equipmentLooses = try JSONDecoder().decode([Equipment].self, from: equipmentData)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    func getPersonnelLooses() {
        guard let personnelURL = Bundle.main.url(forResource: "russia_losses_personnel", withExtension: "json"),
              let personnelData = try? Data(contentsOf: personnelURL) else { return }
        do {
            personnelLooses = try JSONDecoder().decode([Personnel].self, from: personnelData)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    init() {
        getEquipmentLooses()
        getPersonnelLooses()
    }
}
