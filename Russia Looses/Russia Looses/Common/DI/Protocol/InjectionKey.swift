//
//  InjectionKey.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 22.08.2023.
//

import Foundation

protocol InjectionKey {

   /// The associated type representing the type of the dependency injection key's value.
   associatedtype Value

   /// The default value for the dependency injection key.
   static var currentValue: Self.Value { get set }
}
