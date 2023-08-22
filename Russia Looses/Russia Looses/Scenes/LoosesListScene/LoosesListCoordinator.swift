//
//  LoosesListCoordinator.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 22.08.2023.
//

import UIKit

final class LoosesListCoordinator: Coordinator {
    let navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        @Injected(\.viewController) var vc
        navigationController?.pushViewController(vc, animated: true)
    }
    deinit {
        debugPrint("LoosesListCoordinator deinit")
    }
}
