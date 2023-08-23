//
//  LoosesListViewModelProtocol.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 23.08.2023.
//

import Foundation

protocol LoosesListViewModelProtocol {
    func reduceTotalLoses() -> [String: Int]
}
