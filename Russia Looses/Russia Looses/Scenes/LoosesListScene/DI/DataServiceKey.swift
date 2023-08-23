//
//  DataServiceKey.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 23.08.2023.
//

import Foundation

private struct DataServiceKey: InjectionKey {
    static var currentValue: DataServiceProtocol = DataService()
}


extension InjectedValues {
    var dataService: DataServiceProtocol {
        get { Self[DataServiceKey.self] }
        set { Self[DataServiceKey.self] = newValue }
    }
}
