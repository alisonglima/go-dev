import Foundation
import UIKit

protocol HeroViewModelDelegate: AnyObject {
    func heroFetchWithSuccess()
    func errorToFetchHero(_ error: String)
}
