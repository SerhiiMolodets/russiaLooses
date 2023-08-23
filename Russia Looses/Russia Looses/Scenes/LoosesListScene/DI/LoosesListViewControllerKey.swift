//
//  DependencyContainer.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 22.08.2023.
//

import Foundation

private struct LoosesListViewControllerKey: InjectionKey {
    static var currentValue: LoosesListViewController = LoosesListViewController()
}


extension InjectedValues {
    var viewController: LoosesListViewController {
        get { Self[LoosesListViewControllerKey.self] }
        set { Self[LoosesListViewControllerKey.self] = newValue }
    }
}



