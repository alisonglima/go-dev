import UIKit

extension UIStackView {
    func addArrangedSubviews(_ subViews: UIView...) {
        subViews.forEach(addArrangedSubview)
    }
}
