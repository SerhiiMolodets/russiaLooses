//
//  DetailCoordinator.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 24.08.2023.
//

import UIKit

final class DetailCoordinator: Coordinator {
    let navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    @Injected(\.detailViewModel) var viewModel
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let viewController = DetailViewController()
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
    deinit {
        debugPrint("LoosesListCoordinator deinit")
    }
}


