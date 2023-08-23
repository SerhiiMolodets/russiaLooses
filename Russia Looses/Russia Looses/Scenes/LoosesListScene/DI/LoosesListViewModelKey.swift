//
//  LoosesListViewModelKey.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 23.08.2023.
//

import Foundation

private struct LoosesListViewModelKey: InjectionKey {
    static var currentValue: LoosesListViewModelProtocol = LoosesListViewModel()
}


extension InjectedValues {
    var loosesListViewModel: LoosesListViewModelProtocol {
        get { Self[LoosesListViewModelKey.self] }
        set { Self[LoosesListViewModelKey.self] = newValue }
    }
}
