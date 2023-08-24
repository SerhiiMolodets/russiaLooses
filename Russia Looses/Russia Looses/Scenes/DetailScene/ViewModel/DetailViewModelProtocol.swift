//
//  DetailViewModelProtocol.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 24.08.2023.
//

import Foundation
protocol DetailViewModelProtocol {
    var currentLooses: (String, String)? { get set }
    func getHistoryList() -> [DetailModel]
}
