//
//  AppCoordinator.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 22.08.2023.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    var window: UIWindow? { get }
}

final class AppCoordinator: AppCoordinatorProtocol {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    weak var parentCoordinator: Coordinator?
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        openLossesListScene()
    }
    
    private func openLossesListScene() {
        let loosesCoordinator = LoosesListCoordinator(navigationController: navigationController ?? UINavigationController())
        loosesCoordinator.start()
    }
    
}
