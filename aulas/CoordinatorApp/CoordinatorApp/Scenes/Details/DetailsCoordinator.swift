import Foundation
import UIKit

class DetailsCoordinator: Coordinator {
   private(set) var childCoordinator: [Coordinator] = []

    private let navigationController: UINavigationController

//    var parentCoordinator: HomeCoordinator?
    var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let detailsViewController = DetailsViewController()
        let viewModel = DetailsViewModel()

        viewModel.coordinator = self

        detailsViewController.viewModel = viewModel

//        navigationController.present(detailsViewController, animated: true)
        navigationController.pushViewController(detailsViewController, animated: true)
    }
}
