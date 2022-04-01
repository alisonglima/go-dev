import Foundation

class HeroViewModel {
    weak var delegate: HeroViewModelDelegate?
    private var services: HeroListServiceProtocol
    var hero: Hero?
    
    init(services: HeroListServiceProtocol) {
        self.services = services
    }
    
    func fetchHero() {
        services.execute { result in
            switch result {
            case .success(let hero):
                self.success(hero: hero)
            case .failure(let error):
                self.error(error: error.localizedDescription)
            }
        }
    }
    
    private func success(hero: Hero) {
        self.hero = hero
        delegate?.heroFetchWithSuccess()
    }
    
    private func error(error: String) {
        delegate?.errorToFetchHero(error)
    }
}
