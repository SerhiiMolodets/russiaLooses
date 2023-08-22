//
//  Injected.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 22.08.2023.
//

import Foundation

@propertyWrapper

struct Injected<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>
    var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}
