import Foundation
import UIKit

class DetailsViewController: UIViewController {
    var viewModel: DetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel?.title

        view.backgroundColor  = .blue
    }
}
