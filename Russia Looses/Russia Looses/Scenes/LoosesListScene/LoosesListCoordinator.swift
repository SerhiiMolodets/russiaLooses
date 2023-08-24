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
    @Injected(\.loosesListViewModel) var viewModel
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        viewModel.coordinatorDelegate = self
        let viewController = LoosesListViewController()
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
    deinit {
        debugPrint("LoosesListCoordinator deinit")
    }
}


extension LoosesListCoordinator: LoosesListViewModelCoordinatorDelegate {
    func openDetailControllerDelegate(_ sender: (String, String)) {
        print("open new screen \(sender)")
        let coordinator =  DetailCoordinator(navigationController: navigationController ?? UINavigationController())
        coordinator.viewModel.currentLooses = (sender)
        coordinator.start()
    }
}
