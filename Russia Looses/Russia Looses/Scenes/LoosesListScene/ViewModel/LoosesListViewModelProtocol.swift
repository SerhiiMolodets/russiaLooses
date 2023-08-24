//
//  LoosesListViewModelProtocol.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 23.08.2023.
//

import Foundation

protocol LoosesListViewModelProtocol {
    func reduceTotalLoses() -> [String: Int]
    func openDetailController(_ sender: (String, String))
    var coordinatorDelegate: LoosesListViewModelCoordinatorDelegate? { get set }
}
