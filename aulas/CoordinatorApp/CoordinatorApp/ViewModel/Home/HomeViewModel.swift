import Foundation

class HomeViewModel {
    let title = "Home"

    var coordinator: HomeCoordinator?

    func tapDetails() {
        print("Cliquei no botão")

        coordinator?.details()
    }
}
