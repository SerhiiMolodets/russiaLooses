//
//  DependencyContainer.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 22.08.2023.
//

import Foundation

private struct ViewControllerKey: InjectionKey {
    static var currentValue: ViewController = ViewController()
}


extension InjectedValues {
    var viewController: ViewController {
        get { Self[ViewControllerKey.self] }
        set { Self[ViewControllerKey.self] = newValue }
    }
}



