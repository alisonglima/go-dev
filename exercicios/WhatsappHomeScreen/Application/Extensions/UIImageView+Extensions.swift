import UIKit

extension UIImageView {
    func makeRounded() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 35
        self.clipsToBounds = true
    }
}
