//
//  DataServiceProtocol.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 23.08.2023.
//

import Foundation

protocol DataServiceProtocol {
    
    var personnelLooses: [Personnel] { get set }
    var equipmentLooses: [Equipment] { get set }
    
    func getEquipmentLooses()
    func getPersonnelLooses()
    
}
