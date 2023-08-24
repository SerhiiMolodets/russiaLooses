//
//  DetailViewModelKey.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 24.08.2023.
//

import Foundation

private struct DetailViewModelKey: InjectionKey {
    static var currentValue: DetailViewModelProtocol = DetailViewModel()
}


extension InjectedValues {
    var detailViewModel: DetailViewModelProtocol {
        get { Self[DetailViewModelKey.self] }
        set { Self[DetailViewModelKey.self] = newValue }
    }
}
